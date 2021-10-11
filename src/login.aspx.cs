using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace RAMS
{
    public partial class login : System.Web.UI.Page
    {
        private string vssConnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\VSS.mdf;Integrated Security=True;MultipleActiveResultSets=true";
        private string ramsConnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\System_DB.mdf;Integrated Security=True;MultipleActiveResultSets=true";
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataAdapter adapter;
        private DataSet dataSet;
        private bool isStudent = false;
        private bool isAdmin = false;
        private string password;
        private string username;
        private string desiredResidence;
        protected void Page_Load(object sender, EventArgs e)
        {
            //login
            HttpCookie LoginStatus = Request.Cookies["LoginStatus"];

            if (Session["LoggedIn"] != null && Session["LoggedIn"] != "")
            {
                if (isStudent == true)
                {
                    Response.Redirect("home.aspx");
                }
                if (isAdmin == true)
                {
                    Response.Redirect("admin.aspx");
                }
            }
            else
            {
                if (LoginStatus != null)
                {
                    if (LoginStatus["Checked"] == "True")
                    {
                        if (isStudent == true)
                        {
                            Response.Redirect("home.aspx");
                        }
                        if (isAdmin == true)
                        {
                            Response.Redirect("admin.aspx");
                        }
                    }
                }
            }

            

            //Update page
            //update_Page_load();
            changeBtn();

            //Room-Selection
            
        }

        protected void home_load ()
        {
            if (Session["LoggedIn"] != null)
                lblWelcome.Text = Session["LoggedIn"].ToString();
        }

        public void roomSelection ()
        {
            //string query = $"SELECT Gender from Student_Information";
            //if gender is male
            //dropDlistBlockFemales.Enabled = false;
            //string rommNo = rb
            //dropDlistBlockFemales.Items.Add("A");
            dataSet = new DataSet();
            adapter = new SqlDataAdapter();
            char gender;
            string residence;
            string sql = $"SELECT gender, firstChoice FROM StudentAppInfo WHERE universityNum = '{username}";

            try
            {
                connection = new SqlConnection(ramsConnStr);
                connection.Open();

                command = new SqlCommand(sql, connection);
                adapter.SelectCommand = command;
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    gender = char.Parse(reader.GetValue(6).ToString());
                    residence = reader.GetValue(9).ToString();
                }
                connection.Close();
            }
            catch
            {

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand command;
                SqlDataReader dataReader;

                connection = new SqlConnection(vssConnStr);
                connection.Open();

                string sqlStudent = $"SELECT password FROM Student_Information WHERE universityNum = '{tboxUsername.Text}'";
                string sqlAdmin = $"SELECT password FROM Admin_Information WHERE universityNum = '{tboxUsername.Text}'";
                command = new SqlCommand(sqlStudent, connection);

                dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    string tempPassword = dataReader.GetValue(0).ToString();
                    string enteredPassword = tboxPasword.Text;

                    if (String.Compare(tempPassword, enteredPassword) == 0)
                    {
                        HttpCookie Remember = new HttpCookie("LoginStatus");
                        Session["LoggedIn"] = tboxUsername.Text;
                        isStudent = true;

                        Remember.Expires = DateTime.Now.AddMinutes(10);
                        if (cboxRemember.Checked)
                        {
                            Remember["Username"] = tboxUsername.Text;
                            Remember["Checked"] = "True";
                            Remember.Expires =  DateTime.Now.AddDays(2);
                        }
                        else
                        {
                            Remember.Expires = DateTime.Now.AddMinutes(10);
                        }
                        Response.Cookies.Add(Remember);
                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid Password";
                    }
                }
                else
                {
                    lblError.Text = "Invalid Username";
                }

                connection.Close();

                connection = new SqlConnection(vssConnStr);
                connection.Open();

                command = new SqlCommand(sqlAdmin, connection);

                dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    string tempPassword = dataReader.GetValue(0).ToString();
                    string enteredPassword = tboxPasword.Text;

                    if (String.Compare(tempPassword, enteredPassword) == 0)
                    {
                        HttpCookie Remember = new HttpCookie("LoginStatus");
                        Session["LoggedIn"] = tboxUsername.Text;
                        isAdmin = true;

                        Remember.Expires = DateTime.Now.AddMinutes(10);
                        if (cboxRemember.Checked)
                        {
                            Remember["Username"] = tboxUsername.Text;
                            Remember["Checked"] = "True";
                            Remember.Expires = DateTime.Now.AddDays(2);
                        }
                        else
                        {
                            Remember.Expires = DateTime.Now.AddMinutes(10);
                        }
                        Response.Cookies.Add(Remember);
                        Response.Redirect("admin.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid Password";
                    }
                }
                else
                {
                    lblError.Text = "Invalid Username";
                }

                connection.Close();
            }
            catch (Exception error)
            {
                lblError.Text = error.Message;
            }
        }

        protected void btnChoose_Click(object sender, EventArgs e)
        {
            btnChoose.Text = "Click me";
        }

        //Home page
        protected void lbtnRoomSelect_Click (object sender, EventArgs e)
        {
            try
            {
                connection = new SqlConnection(ramsConnStr);
                connection.Open();
                String sql0 = $"SELECT Residence " +
                    $"FROM Placed_Students " +
                    $"Where universityNum Like'%{Session["universityNum"]}%'";

                command = new SqlCommand(sql0, connection);
                SqlDataReader Total = command.ExecuteReader();
                while (Total.Read())
                {
                    Session["Res"] = Total.GetValue(0).ToString();
                }

                connection.Close();

                if (Session["Res"].ToString() == "Kumba")
                {
                    Response.Redirect("Kumba Room Selections.aspx");
                }
                else if (Session["Res"].ToString() == "Thuthuka")
                {
                    Response.Redirect("Thuthuka Room Selection.aspx");
                }
                else if (Session["Res"].ToString() == "Jysmyn")
                {
                    Response.Redirect("Jysmyn_Verries Room Selection.aspx");
                }
                else if (Session["Res"].ToString() == "Vergelegen")
                {
                    Response.Redirect("Jysmyn_Verries Room Selection.aspx");
                }
                else
                {
                    Response.Write("<script>alert('You are not placed. You can contact Admin if you you need to inquire')</script>");
                }


            }
            catch (SqlException error)
            {
                _ = error.Message;
            }
            //Response.Redirect("room-selection.aspx");
        }

        protected void lbtnViewCancel_Click (object sender, EventArgs e)
        {
            Response.Redirect("view-cancel.aspx");
        }

        protected void changeBtn()
        {
            try
            {
                
                if (Session["studentNum"] != null)
                {
                    connection = new SqlConnection(ramsConnStr);
                    connection.Open();

                    string sql_query = $"SELECT * FROM Placed_Students WHERE universityNum = '{Session["studentNum"]}'";
                    command = new SqlCommand(sql_query, connection);
                    command.ExecuteNonQuery();

                    SqlDataReader dataReader;
                    dataReader = command.ExecuteReader();

                    while (dataReader.Read())
                    {
                        //lb.Text = dataReader.GetValue(11) + " " + dataReader.GetValue(2) + " " + dataReader.GetValue(3) + " has been placed at residence: " + dataReader.GetValue(1) + ", room number: " + dataReader.GetValue(13);
                    }

                    dataReader.Close();
                    command.Dispose();

                    connection.Close();
                }
                else
                {
                   // .Text = "The session is prolly null";
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        

        public string getResName()
        {
            connection.Open();

            string query = $"SELECT * FROM Placed_Students WHERE universityNum = '{Session["universityNum"]}'";
            command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            SqlDataReader reader;
            reader = command.ExecuteReader();

            string resName = "";

            while (reader.Read())
            {
                if (reader.GetValue(1).ToString() == "Kumba")
                {
                    resName = reader.GetValue(1).ToString();
                }
                else if (reader.GetValue(1).ToString() == "Thuthuka")
                {
                    resName = reader.GetValue(1).ToString();
                }
                else if (reader.GetValue(1).ToString() == "Jasmyn")
                {
                    resName = reader.GetValue(1).ToString();
                }
                else if (reader.GetValue(1).ToString() == "Vergelegen")
                {
                    resName = reader.GetValue(1).ToString();
                }
            }
            reader.Close();
            command.Dispose();
            connection.Close();

            return resName;
        }

        public string getGender()
        {
            connection.Open();

            string query = $"SELECT * FROM Placed_Students WHERE universityNum = '{Session["universityNum"]}'";
            command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            SqlDataReader reader = command.ExecuteReader();

            string gender = "";

            while (reader.Read())
            {
                gender = reader.GetValue(6).ToString();
            }

            reader.Close();
            command.Dispose();
            connection.Close();

            return gender;
        }
    }
}