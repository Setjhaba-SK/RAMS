using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Res_Admin_Management_System
{

    public partial class Thuthuka_Room_Selection : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand comm;
        SqlDataAdapter adapter;
        DataTable dt;
        String conString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\System_DB.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        
        public String blockType() 
        {
            con = new SqlConnection(conString);
            con.Open();
            String sqlb = $"SELECT block " +
                $"FROM Thuthuka_Rooms Where block='{blocksDropDownList.SelectedValue}'";
            String type;
            comm = new SqlCommand(sqlb, con);
            SqlDataReader Total = comm.ExecuteReader();
            while (Total.Read())
            {
                Session["type"] = Total.GetValue(0).ToString();
            }
            con.Close();
            return Session["type"].ToString();
        }

       

        protected void chooseButton_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(conString);
            
            //update room state
            con.Open();
            string sql = $"Update Thuthuka_Rooms " +
                    $"Set isVacant = 0 " +
                    $"where roomNum = '{RadioButtonList1.SelectedValue}'";
            comm = new SqlCommand(sql, con);
            comm.ExecuteNonQuery();
            con.Close();

            // insert a concatinated room number into Thuthuka table
            con.Open();
            String sql1 = $"Update Thuthuka  Set room = ('30 '+'{blocksDropDownList.SelectedValue} '+'{RadioButtonList1.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
            comm = new SqlCommand(sql1, con);
            comm.ExecuteNonQuery();
            con.Close();

            //insert a concatinated room number into Placed_Student table
            con.Open();
            String sqlplace = $"Update Placed_Students  Set room = ('30 '+'{blocksDropDownList.SelectedValue} '+'{RadioButtonList1.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
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
            

            RadioButtonList1.Visible = false;
        }

        protected void blocksDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (blocksDropDownList.SelectedValue ==blockType())
            {
                con = new SqlConnection(conString);
                con.Open();

                string sql = $"SELECT roomNum From Thuthuka_Rooms Where block = '{blockType()}' And isVacant=1";
                comm = new SqlCommand(sql, con);
                dt = new DataTable();
                adapter = new SqlDataAdapter(comm);

                adapter.Fill(dt);
                RadioButtonList1.DataSource = dt;
                RadioButtonList1.DataTextField = "roomNum";
                RadioButtonList1.DataValueField = "roomNum";
                RadioButtonList1.DataBind();
                con.Close();
            }
        }
    }
}