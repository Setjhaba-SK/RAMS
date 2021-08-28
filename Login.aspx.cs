/*using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.IO;

namespace RAMS
{
    public partial class Login : System.Web.UI.Page
    {
        private string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\Programs\RAMS\App_Data\Students.mdf;
                                   Integrated Security=True;MultipleActiveResultSets=true";
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataAdapter adapter;
        private DataSet dataSet;
        private HttpCookie studentUser = new HttpCookie("StudentInfo");
        private HttpCookie adminUser = new HttpCookie("AdminInfo");
        private bool isStudent = false;
        private bool isAdmin = false;
        private int studentNum = 0;
        private string fullName = "", email = "", phoneNum = "", gender = "", qualification = "", title = "", funding = "", currRes = "", nextRes = "", roomType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(connStr);
            adapter = new SqlDataAdapter();
            dataSet = new DataSet();
            string retriveFromTxtFile = $"INSERT INTO Students (StudentNum, FullName, Email, PhoneNum, Gender, Qualification, Title, Funding, CurrRes, NextRes, RoomType) " +
                                          $"VALUES (@studentNum, @names, @email, @phoneNum, @gender, @qual, @title, @funding, @curr, @next, @roomType)";
            string queryInsertInfo = $"";
            string queryAuthStudent = $"SELECT StudentNum, Password FROM Students";
            string queryAuthAdmin = $"SELECT UniversityNum, Password FROM Admins";
            string password = tboxPassword.Text;
            string username = tboxName.Text;
            string rootFolder = "C:/Users/lagar/DesktopPrograms/RAMS";
            string textFile = "C:/Users/lagar/DesktopPrograms/RAMS/Students.txt";
            lblError.Text = studentNum.ToString();

            try
            {
                if (File.Exists(textFile))
                {
                    // Read file using StreamReader. Reads file line by line  
                    using (StreamReader file = new StreamReader(textFile))
                    {
                        int counter = 0;
                        string line;

                        while ((line = file.ReadLine()) != null)
                        {
                            string[] data = line.Split(',');
                            studentNum = int.Parse(data[0]);
                            fullName = data[1];
                            email = data[2];
                            phoneNum = data[3];
                            gender = data[4];
                            qualification = data[5];
                            title = data[6];
                            funding = data[7];
                            currRes = data[8];
                            nextRes = data[9];
                            roomType = data[10];
                            counter++;
                        }
                        file.Close();
                    }
                }

                connection.Open();

                command = new SqlCommand(retriveFromTxtFile, connection);
                command.Parameters.AddWithValue("@studentNum", studentNum);
                command.Parameters.AddWithValue("@names", fullName);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@phoneNum", phoneNum);
                command.Parameters.AddWithValue("@gender", gender);
                command.Parameters.AddWithValue("@qual", qualification);
                command.Parameters.AddWithValue("@title", title);
                command.Parameters.AddWithValue("@funding", funding);
                command.Parameters.AddWithValue("@curr", currRes);
                command.Parameters.AddWithValue("@next", nextRes);
                command.Parameters.AddWithValue("@roomType", roomType);

                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                //selectComm = new SqlCommand(queryAuthStudent, connection);

                //var reader = selectComm.ExecuteReader();

                //while (reader.Read())
                //{
                //    if (username != reader.GetValue(0).ToString())
                //    {
                //        if (password != reader.GetValue(15).ToString())
                //        {

                //        }
                //        else
                //        {
                //            lblError.Text = "Password already taken!";
                //        }
                //    }
                //}

                connection.Close();
            }
            catch (SqlException error)
            {
                //throw error;
            }

            HttpCookie loginStudent = Request.Cookies["StudentInfo"];
            HttpCookie loginAdmin = Request.Cookies["AdminInfo"];
            //Session["loginStatus"] = tboxName.Text;

            if (Session["Username"] != null && Session["Password"] != null)
            {
                if (isStudent == true)
                {
                    Response.Redirect("Home.aspx");
                }
                if (isAdmin == true)
                {
                    Response.Redirect("Admin.aspx");
                }
            }
            else
            {
                if (loginStudent != null)
                {
                    if (loginStudent["Checked"] == "True")
                        Response.Redirect("Home.aspx");
                }

                if (loginAdmin != null)
                {
                    if (loginAdmin["Checked"] == "True")
                        Response.Redirect("Admin.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string queryAuthStudent = $"SELECT StudentNum, Password FROM Students";
            string queryAuthAdmin = $"SELECT UniversityNum, Password FROM Admins";
            string password = tboxPassword.Text;
            string username = tboxName.Text;
            var studentUser = new HttpCookie("StudentInfo");
            var adminUser = new HttpCookie("AdminInfo");


            try
            {
                connection.Open();

                command = new SqlCommand(queryAuthStudent, connection);
                command = new SqlCommand(queryAuthAdmin, connection);
                adapter.SelectCommand = command;
                var studentReader = command.ExecuteReader();

                //Student Athenticatication
                //Check if Student/Admin number and Password exist from the Student DB 
                while (studentReader.Read())
                {
                    if (studentReader.GetValue(0).ToString() == username && studentReader.GetValue(15).ToString() == password)
                    {
                        isStudent = true;
                    }
                    else
                    {
                        isStudent = false;

                    }
                }

                if (isStudent == true)
                {
                    Session["Username"] = username;
                    Session["Password"] = password;

                    if (cBoxRememberme.Checked)
                    {
                        studentUser["Username"] = username;
                        studentUser["Checked"] = "true";
                        studentUser.Expires = DateTime.Now.AddDays(5);
                    }
                    else
                    {
                        studentUser.Expires = DateTime.Now.AddMinutes(10);
                    }

                    Response.Cookies.Add(studentUser);
                }
                else
                    reqValidName.ErrorMessage = "Invalid credentials!";

                connection.Close();

                connection.Open();

                command = new SqlCommand(queryAuthAdmin, connection);
                adapter.SelectCommand = command;
                var adminReader = command.ExecuteReader();

                //Admin Athenticatication
                //Check if Student/Admin number and Password exist from an Admins DB
                while (adminReader.Read())
                {
                    while (adminReader.Read())
                    {

                        if ((adminReader.GetValue(0).ToString() == username && adminReader.GetValue(4).ToString() == password))
                        {
                            isAdmin = true;
                        }
                        else
                        {
                            isAdmin = false;
                        }
                    }

                    if (isAdmin == true)
                    {
                        Session["Username"] = username;
                        Session["Password"] = password;

                        if (cBoxRememberme.Checked)
                        {
                            adminUser["Username"] = username;
                            adminUser["Checked"] = "true";
                            adminUser.Expires = DateTime.Now.AddDays(5);
                        }
                        else
                        {
                            adminUser.Expires = DateTime.Now.AddMinutes(10);
                        }
                        Response.Cookies.Add(adminUser);
                    }
                    else
                        reqValidName.ErrorMessage = "Invalid credentials!";

                    connection.Close();
                }
            }
            catch (SqlException error)
            {
                throw error;
            }
        }
    }
}*/