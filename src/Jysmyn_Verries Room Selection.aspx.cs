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
    public partial class Jysmyn_Verries_Room_Selection : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand comm;
        SqlDataAdapter adapter;
        DataTable dt;
        String conString= @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\System_DB.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Res"].ToString() == "Vergelegen")//this will show only the res which that student is placed at
            {
                jasmynPanel.Visible = false; //makes the Jasmyn panel invisible if the student is placed at verries

                //This will populate the radiobuttonlist with the rooms of the first block(acts as a default) for verries
                con = new SqlConnection(conString);
                con.Open();

                string sql = $"SELECT roomNum From Vergelegen_Rooms Where block = '{getBlockTypeVerries()}' And isVacant = 1";
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
            else
            {
                verriesPanel.Visible = false;//makes the verries panel invisible if the student is placed at jasmyn

                //This will populate the radiobuttonlist with the rooms of the first block(acts as a default) for Jasmyn
                con = new SqlConnection(conString);
                con.Open();

                string sql = $"SELECT roomNum From Jasmyn_Rooms Where block = '{getBlockTypeJysmyn()}' And isVacant = 1";
                comm = new SqlCommand(sql, con);
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

        //The Methods Check the selected value on the dropdownlist against blocks on the verries Table
        public String getBlockTypeVerries()
        {
            con = new SqlConnection(conString);
            con.Open();
            String sqlb = $"SELECT block " +
                $"FROM Vergelegen_Rooms Where block='{DropDownList1.SelectedValue}'";
            comm = new SqlCommand(sqlb, con);
            SqlDataReader check =  comm.ExecuteReader();
            String type ="";
            while (check.Read())
            {
                if (check.GetValue(0).ToString() == "A")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "B")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "C")
                { 
                    type = check.GetValue(0).ToString(); 
                }
                else if (check.GetValue(0).ToString() == "D")
                { 
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "E")
                { 
                    type = check.GetValue(0).ToString(); 
                }
                else if (check.GetValue(0).ToString() == "F")
                {
                    type = check.GetValue(0).ToString(); 
                }

                
            }
            con.Close();
            return type;
        }

        //The Methods Check the selected value on the dropdownlist against blocks on the Jasmyn Table 
        public String getBlockTypeJysmyn()
        {
            con = new SqlConnection(conString);
            con.Open();
            String sqlb = $"SELECT block " +
                $"FROM Jasmyn_Rooms Where block='{DropDownList2.SelectedValue}'";
            comm = new SqlCommand(sqlb, con);
            SqlDataReader check = comm.ExecuteReader();
            String type = "";
            while (check.Read())
            {
                if (check.GetValue(0).ToString() == "G")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "H")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "I")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "J")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "L")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "M")
                {
                    type = check.GetValue(0).ToString();
                }
                else if (check.GetValue(0).ToString() == "N")
                {
                    type = check.GetValue(0).ToString();
                }


            }
            con.Close();
            return type;
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //populate the radiobutton list with the room numbers that are still vacant
            if (DropDownList1.SelectedValue == getBlockTypeVerries())
            {
                con = new SqlConnection(conString);
                con.Open();

                string sql = $"SELECT roomNum From Vergelegen_Rooms Where block = '{getBlockTypeVerries()}' And isVacant=1";
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


        
        protected void chooseButton_Click(object sender, EventArgs e) //verries button
        {
            try
            {
                con = new SqlConnection(conString);

                //Changes the state of the room that is selected on the radiobutton list
                con.Open();
                string sql = $"Update Vergelegen_Rooms " +
                        $"Set isVacant = 0 " +
                        $"where roomNum = '{RadioButtonList1.SelectedValue}'";
                comm = new SqlCommand(sql, con);
                comm.ExecuteNonQuery();
                con.Close();

                // inserts a concatinated room number into verries table for that specific student
                con.Open();
                String sql1 = $"Update Vergelegen  Set room = ('13 '+'{DropDownList1.SelectedValue} '+'{RadioButtonList1.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
                comm = new SqlCommand(sql1, con);
                comm.ExecuteNonQuery();
                con.Close();

                //insert a concatinated room number into Placed_Student table for that specific student
                con.Open();
                String sqlplace = $"Update Placed_Students  Set room = ('13 '+'{DropDownList1.SelectedValue} '+'{RadioButtonList1.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
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
                con.Close();
            }
            catch(SqlException err)
            {
                _ = err.Message;
            }
        }

        protected void choosejysmynButton_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(conString);

                //Changes the state of the room that is selected on the radiobutton list
                con.Open();
                string sql = $"Update Jasmyn_Rooms " +
                        $"Set isVacant = 0 " +
                        $"where roomNum = '{RadioButtonList2.SelectedValue}'";
                comm = new SqlCommand(sql, con);
                comm.ExecuteNonQuery();
                con.Close();

                // inserts a concatinated room number into Jasmyn table for that specific student
                con.Open();
                String sql1 = $"Update Jasmyn Set room = ('14 '+'{DropDownList2.SelectedValue} '+'{RadioButtonList2.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
                comm = new SqlCommand(sql1, con);
                comm.ExecuteNonQuery();
                con.Close();

                //insert a concatinated room number into Placed_Student table for that specific student
                con.Open();
                String sqlplace = $"Update Placed_Students  Set room = ('14 '+'{DropDownList2.SelectedValue} '+'{RadioButtonList2.SelectedValue}') Where universityNum = '{Session["universityNum"]}'";
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
                con.Close();
            }
            catch (SqlException err)
            {
                _ = err.Message;
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //populate the radiobutton list with the room numbers that are still vacant
            if (DropDownList2.SelectedValue == getBlockTypeJysmyn())
            {
                con = new SqlConnection(conString);
                con.Open();

                string sql = $"SELECT roomNum From Jasmyn_Rooms Where block = '{getBlockTypeJysmyn()}' And isVacant=1";
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