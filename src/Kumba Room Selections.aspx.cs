using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Res_Admin_Management_System;
using System.Data;
using System.Data.SqlClient;

namespace Res_Admin_Management_System
{
    public partial class Kumba_Room_Selections : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand comm;
        SqlDataAdapter adapter;
        DataTable dt;
        String conString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\System_DB.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //The Methods Check the selected value on the dropdownlist against blocks on the khumba Table
        public String getblockType()
        {

            con = new SqlConnection(conString);
            con.Open();
            String sqlb = $"SELECT block " +
                $"FROM Thuthuka_Rooms Where block='{blocksDropDownList.SelectedValue}'";
            
            comm = new SqlCommand(sqlb, con);
            SqlDataReader check = comm.ExecuteReader();
            while (check.Read())
            {
                Session["block"] = check.GetValue(0).ToString();//used session just to shorten the code :(
            }
            con.Close();
            return Session["block"].ToString();
        }
        

        protected void chooseButton_Click(object sender, EventArgs e)
        {
            if (singleRadioButton.Checked && RadioButtonList1.SelectedIndex>-1)//The if statement check if the corresponding radiobutton for type of room and the radiobutton list we selected  
            {
                con = new SqlConnection(conString);
                con.Open();

                string sql = $"Update Kumba_Rooms " +
                    $"Set isVacant = 0 " +
                    $"where roomNum = '{RadioButtonList1.SelectedValue}' AND block = '{blocksDropDownList.SelectedValue}'";
                comm = new SqlCommand(sql, con);

                comm.ExecuteNonQuery();
                con.Close();


                con.Open();
                String sql1 = $"Update Kumba  Set room = ('30 '+'{blocksDropDownList.SelectedValue} '+'{RadioButtonList1.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
                comm = new SqlCommand(sql1, con);
                comm.ExecuteNonQuery();
                con.Close();

                con.Open();
                String sqlplace = $"Update Placed_Students  Set room = ('30 '+'{blocksDropDownList.SelectedValue} '+'{RadioButtonList1.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
                comm = new SqlCommand(sqlplace, con);
                comm.ExecuteNonQuery();
                con.Close();

                con.Open();
                String sql4 = $"select totalRooms from Residences Where resName = '{Session["Res"]}'";
                int a = 0;
                comm = new SqlCommand(sql4, con);
                SqlDataReader Total = comm.ExecuteReader();
                while (Total.Read())
                {
                    a = a + Convert.ToInt32(Total.GetValue(0));
                }
                con.Close();
                if (a > 0)
                {
                    con.Open();
                    string sql3 = $"Update Residences " +
                            $"Set totalRooms = (totalRooms - 1) " +
                            $"where resName = '{Session["Res"]}'";
                    comm = new SqlCommand(sql3, con);

                    comm.ExecuteNonQuery();
                }
                con.Close();

                
            }
            else if(sharingRadioButton.Checked && RadioButtonList2.SelectedIndex>-1)
            {
                con = new SqlConnection(conString);
                con.Open();
                //Changes the state of the room that is selected on the radiobutton list
                string sql = $"Update Kumba_Rooms " +
                    $"Set isVacant = 0 " +
                    $"where roomNum = '{RadioButtonList2.SelectedValue}' AND block = '{blocksDropDownList.SelectedValue}'";
                comm = new SqlCommand(sql, con);

                comm.ExecuteNonQuery();
                con.Close();

                // inserts a concatinated room number into Kumba table for that specific student
                con.Open();
                String sql1 = $"Update Kumba  Set room = ('30 '+'{blocksDropDownList.SelectedValue} '+'{RadioButtonList2.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
                comm = new SqlCommand(sql1, con);
                comm.ExecuteNonQuery();
                con.Close();

                //insert a concatinated room number into Placed_Student table for that specific student
                con.Open();
                String sqlplace = $"Update Placed_Students  Set room = ('30 '+'{blocksDropDownList.SelectedValue} '+'{RadioButtonList2.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
                comm = new SqlCommand(sqlplace, con);
                comm.ExecuteNonQuery();
                con.Close();

                //selects a resident in residence table and decreament the total
                con.Open();
                String sql4 = $"select totalRooms from Residences Where resName = '{Session["Res"]}'";
                int a = 0;
                comm = new SqlCommand(sql4, con);
                SqlDataReader Total = comm.ExecuteReader();
                while (Total.Read())
                {
                    a = a + Convert.ToInt32(Total.GetValue(0));
                }
                con.Close();
                if (a > 0)//this checks if there are still rooms available and decreament the total whenever a room is selected
                {
                    con.Open();
                    string sql3 = $"Update Residences " +
                            $"Set totalRooms = (totalRooms - 1) " +
                            $"where resName = '{Session["Res"]}'";
                    comm = new SqlCommand(sql3, con);

                    comm.ExecuteNonQuery();
                }
                else
                {
                    Response.Write("<script>alert('There are no rooms left')</script>");
                }
                con.Close();

                
            }
            else
            {
                Response.Write("<script>alert('You might have selected wrong type of room or not selected')</script>");
            }
        }

        protected void blocksDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
         
            //this populates the radiobutton list with the room numbers of the selected block
            if(blocksDropDownList.SelectedValue == getblockType())
            {
                con = new SqlConnection(conString);
                con.Open();
                //populates the single rooms radio button list
                string sql = $"SELECT roomNum From Kumba_Rooms Where block = '{getblockType()}' And isVacant=1 And (roomNum like '%{02}' OR roomNum like '%{04}' OR roomNum like '%{05}') ";
                comm = new SqlCommand(sql, con);
                dt = new DataTable();
                adapter = new SqlDataAdapter(comm);

                adapter.Fill(dt);
                RadioButtonList1.DataSource = dt;
                RadioButtonList1.DataTextField = "roomNum";
                RadioButtonList1.DataValueField = "roomNum";
                RadioButtonList1.DataBind();
                con.Close();

                con.Open();
                //populates the sharing rooms radio button list
                string sql1 = $"SELECT roomNum From Kumba_Rooms Where block = '{getblockType()}' And isVacant=1 And (roomNum like '%{06}' OR roomNum like '%{07}' OR roomNum like '%{08}')";
                comm = new SqlCommand(sql1, con);
                dt = new DataTable();
                adapter = new SqlDataAdapter(comm);

                adapter.Fill(dt);
                RadioButtonList2.DataSource = dt;
                RadioButtonList2.DataTextField = "roomNum";
                RadioButtonList2.DataValueField = "roomNum";
                RadioButtonList2.DataBind();
                con.Close();
            }
           
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            
        }
    }
}