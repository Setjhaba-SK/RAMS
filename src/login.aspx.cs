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
        protected void Page_Load(object sender, EventArgs e)
        {
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
        }

        public void roomSelection ()
        {
            //string query = $"SELECT Gender from Student_Information";
            //if gender is male
            //dropDlistBlockFemales.Enabled = false;
            //string rommNo = rb
            //dropDlistBlockFemales.Items.Add("A");
            

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
    }
}