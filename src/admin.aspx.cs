using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace RAMS
{
    public partial class admin : System.Web.UI.Page
    {
        private string vssConnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\VSS.mdf;Integrated Security=True;MultipleActiveResultSets=true";
        private string ramsConnStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\lagar\Desktop\RAMS\App_Data\System_DB.mdf;Integrated Security=True;MultipleActiveResultSets=true";
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataAdapter adapter;
        private DataSet dataSet;
        public string uniNUm = "", residence = "";
        private int counter = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Code to delete all the records in the tables when the admin page is loaded for the first time. To avoid duplicating data in the respective tables when placing students.
                try
                {
                    //connection = new SqlConnection(ramsConnStr);
                    //connection.Open();

                    //string del = "DELETE FROM WaitingList";
                    //command = new SqlCommand(del, connection);
                    //command.ExecuteNonQuery();

                    //string del_k = "DELETE FROM Kumba";
                    //command = new SqlCommand(del_k, connection);
                    //command.ExecuteNonQuery();

                    //string del_t = "DELETE FROM Thuthuka";
                    //command = new SqlCommand(del_t, connection);
                    //command.ExecuteNonQuery();

                    //string del_j = "DELETE FROM Jasmyn";
                    //command = new SqlCommand(del_j, connection);
                    //command.ExecuteNonQuery();

                    //string del_v = "DELETE FROM Vergelegen";
                    //command = new SqlCommand(del_v, connection);
                    //command.ExecuteNonQuery();

                    //string del_ps = "DELETE FROM Placed_Students";
                    //command = new SqlCommand(del_ps, connection);
                    //command.ExecuteNonQuery();

                    //connection.Close();

                    //viewStudentRecords();
                    viewResApplications();
                    viewPlacedStudents();
                    viewWaitingListStudents();
                    viewNotPlaced();
                    update();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
            }
        }

        protected void btnJasmyn_Click(object sender, EventArgs e)
        {
            try
            {
                connection = new SqlConnection(ramsConnStr);
                connection.Open();

                string sqlInsert = "INSERT INTO Jasmyn(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability) SELECT universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability FROM StudentAppInfo WHERE firstChoice = 'Jasmyn' AND average >= 76";
                command = new SqlCommand(sqlInsert, connection);
                command.ExecuteNonQuery();

                string insertWL = "INSERT INTO WaitingList(universityNum, average, qualification) SELECT universityNum, average, qualification FROM StudentAppInfo WHERE firstChoice = 'Jasmyn' AND average < 76";
                command = new SqlCommand(insertWL, connection);
                command.ExecuteNonQuery();

                connection.Close();

            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }



        protected void btnKumba_Click(object sender, EventArgs e)
        {
            try
            {
                connection = new SqlConnection(ramsConnStr);
                connection.Open();

                string sqlInsert = "INSERT INTO Kumba(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability) SELECT universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability FROM StudentAppInfo WHERE firstChoice = 'Kumba' AND average >= 65";
                command = new SqlCommand(sqlInsert, connection);
                command.ExecuteNonQuery();

                string insertWL = "INSERT INTO WaitingList(universityNum, average, qualification) SELECT universityNum, average, qualification FROM StudentAppInfo WHERE firstChoice = 'Kumba' AND average < 65";
                command = new SqlCommand(insertWL, connection);
                command.ExecuteNonQuery();

                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        protected void btnThuthuka_Click(object sender, EventArgs e)
        {
            try
            {
                connection = new SqlConnection(ramsConnStr);
                connection.Open();

                string sqlInsert = "INSERT INTO Thuthuka(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability) SELECT universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability FROM StudentAppInfo WHERE firstChoice = 'Thuthuka' AND average >= 74";
                command = new SqlCommand(sqlInsert, connection);
                command.ExecuteNonQuery();

                string insertWL = "INSERT INTO WaitingList(universityNum, average, qualification) SELECT universityNum, average, qualification FROM StudentAppInfo WHERE firstChoice = 'Thuthuka' AND average < 74";
                command = new SqlCommand(insertWL, connection);
                command.ExecuteNonQuery();

                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        protected void btnVergelegen_Click(object sender, EventArgs e)
        {
            try
            {
                connection = new SqlConnection(ramsConnStr);
                connection.Open();

                string sqlInsert = "INSERT INTO Vergelegen(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability) SELECT universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegistered, hasDisability FROM StudentAppInfo WHERE firstChoice = 'Vergelegen' AND average >= 76";
                command = new SqlCommand(sqlInsert, connection);
                command.ExecuteNonQuery();

                string insertWL = "INSERT INTO WaitingList(universityNum, average, qualification) SELECT universityNum, average, qualification FROM StudentAppInfo WHERE firstChoice = 'Vergelegen' AND average < 76";
                command = new SqlCommand(insertWL, connection);
                command.ExecuteNonQuery();

                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        //Methods to avoid code repetition
        public void viewStudentRecords()
        {
            connection = new SqlConnection(vssConnStr);
            try
            {
                connection.Open();

                string sql = "SELECT * FROM Student_Information";
                command = new SqlCommand(sql, connection);

                adapter = new SqlDataAdapter();
                dataSet = new DataSet();

                adapter.SelectCommand = command;
                adapter.Fill(dataSet);

                gridViewPlace.DataSource = dataSet;
                gridViewPlace.DataBind();

                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public void viewPlacedStudents()
        {
            connection = new SqlConnection(ramsConnStr);
            try
            {
                connection.Open();

                string sql = "SELECT * FROM Placed_Students";
                command = new SqlCommand(sql, connection);

                adapter = new SqlDataAdapter();
                dataSet = new DataSet();

                adapter.SelectCommand = command;
                adapter.Fill(dataSet);

                gridViewStudentsPlaced.DataSource = dataSet;
                gridViewStudentsPlaced.DataBind();

                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public void viewWaitingListStudents()
        {
            connection = new SqlConnection(ramsConnStr);
            try
            {
                connection.Open();

                string sql = "SELECT * FROM WaitingList";
                command = new SqlCommand(sql, connection);

                adapter = new SqlDataAdapter();
                dataSet = new DataSet();



                adapter.SelectCommand = command;
                adapter.Fill(dataSet);

                gridViewWaitingList.DataSource = dataSet;
                gridViewWaitingList.DataBind();

                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public void viewResApplications()
        {
            connection = new SqlConnection(ramsConnStr);
            try
            {
                connection.Open();

                string sql = "SELECT * FROM StudentAppInfo";
                command = new SqlCommand(sql, connection);

                adapter = new SqlDataAdapter();
                dataSet = new DataSet();

                adapter.SelectCommand = command;
                adapter.Fill(dataSet);

                gridViewPlace.DataSource = dataSet;
                gridViewPlace.DataBind();

                connection.Close();
            }
            catch (SqlException ex)
            {
                //errorLabel.Text = ex.Message;
                throw ex;
            }
        }

        public void viewNotPlaced()
        {
            connection = new SqlConnection(vssConnStr);

            connection.Open();

            string query = "SELECT TOP 50 * FROM Student_Information ORDER BY universityNum DESC";
            command = new SqlCommand(query, connection);

            adapter = new SqlDataAdapter();
            dataSet = new DataSet();

            adapter.SelectCommand = command;
            adapter.Fill(dataSet);

            gridViewAddStudent.DataSource = dataSet;
            gridViewAddStudent.DataBind();

            connection.Close();
        }

        public void insertIntoPlacedStudents()
        {
            connection = new SqlConnection(ramsConnStr);

            try
            {
                connection.Open();

                string insertK_query = "INSERT INTO Placed_Students(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, hasDisability, room) " +
                                      "SELECT Kumba.universityNum, Kumba.firstName, Kumba.lastName, Kumba.email, Kumba.phoneNum, Kumba.gender, Kumba.nationality, Kumba.qualification, Kumba.historicalYear, Kumba.average, Kumba.title, Kumba.hasDisability, Kumba.room FROM Kumba";
                command = new SqlCommand(insertK_query, connection);
                command.ExecuteNonQuery();

                string insertT_query = "INSERT INTO Placed_Students(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, hasDisability, room) " +
                                       "SELECT Thuthuka.universityNum, Thuthuka.firstName, Thuthuka.lastName, Thuthuka.email, Thuthuka.phoneNum, Thuthuka.gender, Thuthuka.nationality, Thuthuka.qualification, Thuthuka.historicalYear, Thuthuka.average, Thuthuka.title, Thuthuka.hasDisability, Thuthuka.room FROM Thuthuka";
                command = new SqlCommand(insertT_query, connection);
                command.ExecuteNonQuery();

                string insertJ_query = "INSERT INTO Placed_Students(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, hasDisability, room) " +
                                       "SELECT Jasmyn.universityNum, Jasmyn.firstName, Jasmyn.lastName, Jasmyn.email, Jasmyn.phoneNum, Jasmyn.gender, Jasmyn.nationality, Jasmyn.qualification, Jasmyn.historicalYear, Jasmyn.average, Jasmyn.title, Jasmyn.hasDisability, Jasmyn.room FROM Jasmyn";
                command = new SqlCommand(insertJ_query, connection);
                command.ExecuteNonQuery();

                string insertV_query = "INSERT INTO Placed_Students(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, hasDisability, room) " +
                                       "SELECT Vergelegen.universityNum, Vergelegen.firstName, Vergelegen.lastName, Vergelegen.email, Vergelegen.phoneNum, Vergelegen.gender, Vergelegen.nationality, Vergelegen.qualification, Vergelegen.historicalYear, Vergelegen.average, Vergelegen.title, Vergelegen.hasDisability, Vergelegen.room FROM Vergelegen";
                command = new SqlCommand(insertV_query, connection);
                command.ExecuteNonQuery();

                string insertResNameK = "UPDATE Placed_Students SET Residence = 'Kumba' WHERE EXISTS (SELECT universityNum FROM Kumba WHERE Kumba.universityNum = Placed_Students.universityNum)";
                command = new SqlCommand(insertResNameK, connection);
                adapter = new SqlDataAdapter();
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                string insertResNameT = "UPDATE Placed_Students SET Residence = 'Thuthuka' WHERE EXISTS (SELECT universityNum FROM Thuthuka WHERE Thuthuka.universityNum = Placed_Students.universityNum)";
                command = new SqlCommand(insertResNameT, connection);
                adapter = new SqlDataAdapter();
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                string insertResNameJ = "UPDATE Placed_Students SET Residence = 'Jasmyn' WHERE EXISTS (SELECT universityNum FROM Jasmyn WHERE Jasmyn.universityNum = Placed_Students.universityNum)";
                command = new SqlCommand(insertResNameJ, connection);
                adapter = new SqlDataAdapter();
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                string insertResNameV = "UPDATE Placed_Students SET Residence = 'Vergelegen' WHERE EXISTS (SELECT universityNum FROM Vergelegen WHERE Vergelegen.universityNum = Placed_Students.universityNum)";
                command = new SqlCommand(insertResNameV, connection);
                adapter = new SqlDataAdapter();
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                connection.Close();
            }
            catch (SqlException ex)
            {
                //errorLabel.Text = ex.Message;
                throw ex;
            }
        }

        protected void dropDListRes_SelectedIndexChanged(object sender, EventArgs e)
        {

            connection = new SqlConnection(ramsConnStr);
            try
            {
                string sql = "";
                connection.Open();

                if (this.dropDListRes.SelectedValue.Equals("Jasmyn"))
                {
                    sql = "SELECT * FROM Jasmyn";
                }
                else if (this.dropDListRes.SelectedValue.Equals("Kumba"))
                {
                    sql = "SELECT * FROM Kumba";
                }
                else if (this.dropDListRes.SelectedValue.Equals("Thuthuka"))
                {
                    sql = "SELECT * FROM Thuthuka";
                }
                else
                {
                    sql = "SELECT * FROM Vergelegen";
                }

                command = new SqlCommand(sql, connection);

                adapter = new SqlDataAdapter();
                dataSet = new DataSet();

                adapter.SelectCommand = command;
                adapter.Fill(dataSet);

                gridViewStudentsPlaced.DataSource = dataSet;
                gridViewStudentsPlaced.DataBind();

                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        protected void btnAdd2_Click(object sender, EventArgs e)
        {
            connection = new SqlConnection(ramsConnStr);
            SqlConnection vssCon = new SqlConnection(vssConnStr);

            vssCon.Open();

            string firstName = "", lastName = "", email = "", phoneNum = "", gender = "", nationality = "", qualification = "", title = "", isRegistered = "", hasDisabily = "", residence = "";
            int average = 0, historicalYear = 0;

            string query = $"SELECT * FROM Student_Information WHERE universityNum = '{tboxAdd.Text}'";
            command = new SqlCommand(query, vssCon);

            SqlDataReader reader;
            reader = command.ExecuteReader();

            while (reader.Read())
            {
                firstName = reader.GetValue(1).ToString();
                lastName = reader.GetValue(2).ToString();
                email = reader.GetValue(3).ToString();
                phoneNum = reader.GetValue(5).ToString();
                gender = reader.GetValue(6).ToString();
                nationality = reader.GetValue(7).ToString();
                qualification = reader.GetValue(8).ToString();
                historicalYear = int.Parse(reader.GetValue(9).ToString());
                average = int.Parse(reader.GetValue(10).ToString());
                title = reader.GetValue(11).ToString();
                isRegistered = reader.GetValue(13).ToString();
                hasDisabily = reader.GetValue(14).ToString();
            }

            reader.Close();
            command.Dispose();
            vssCon.Close();

            residence = dropDListNext.SelectedValue.ToString();

            connection.Open();
            string insert_queryPS = $"INSERT INTO Placed_Students(universityNum, Residence, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, hasDisability)" +
                $"VALUES ('{tboxAdd.Text}', '{residence}', '{firstName}', '{lastName}', '{email}', '{phoneNum}', '{gender}', '{nationality}', '{qualification}', '{historicalYear}', '{average}', '{title}', '{hasDisabily}')";
            command = new SqlCommand(insert_queryPS, connection);

            adapter = new SqlDataAdapter();

            adapter.InsertCommand = command;
            adapter.InsertCommand.ExecuteNonQuery();
            connection.Close();

            if (residence == "Kumba")
            {
                connection.Open();
                string insertK_query = $"INSERT INTO Kumba(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegisted, hasDisability)" +
                $"VALUES ('{tboxAdd.Text}', '{firstName}', '{lastName}', '{email}', '{phoneNum}', '{gender}', '{nationality}', '{qualification}', '{historicalYear}', '{average}', '{title}', '{isRegistered}', '{hasDisabily}')";
                command = new SqlCommand(insertK_query, connection);

                adapter = new SqlDataAdapter();

                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                connection.Close();
            }
            else if (residence == "Thuthuka")
            {
                connection.Open();
                string insertK_query = $"INSERT INTO Thuthuka(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegisted, hasDisability)" +
                $"VALUES ('{tboxAdd.Text}', '{firstName}', '{lastName}', '{email}', '{phoneNum}', '{gender}', '{nationality}', '{qualification}', '{historicalYear}', '{average}', '{title}', '{isRegistered}', '{hasDisabily}')";
                command = new SqlCommand(insertK_query, connection);

                adapter = new SqlDataAdapter();

                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                connection.Close();
            }
            else if (residence == "Jasmyn")
            {
                connection.Open();
                string insertK_query = $"INSERT INTO Jasmyn(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegisted, hasDisability)" +
                $"VALUES ('{tboxAdd.Text}', '{firstName}', '{lastName}', '{email}', '{phoneNum}', '{gender}', '{nationality}', '{qualification}', '{historicalYear}', '{average}', '{title}', '{isRegistered}', '{hasDisabily}')";
                command = new SqlCommand(insertK_query, connection);

                adapter = new SqlDataAdapter();

                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                connection.Close();
            }
            else if (residence == "Vergelegen")
            {
                connection.Open();
                string insertK_query = $"INSERT INTO Vergelegen(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, isRegisted, hasDisability)" +
                $"VALUES ('{tboxAdd.Text}', '{firstName}', '{lastName}', '{email}', '{phoneNum}', '{gender}', '{nationality}', '{qualification}', '{historicalYear}', '{average}', '{title}', '{isRegistered}', '{hasDisabily}')";
                command = new SqlCommand(insertK_query, connection);

                adapter = new SqlDataAdapter();

                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                connection.Close();
            }
        }

        public string getGender()
        {
            connection.Open();

            string query = $"SELECT * FROM Placed_Students WHERE universityNum = '{uniNUm}'";
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

        public string getResName()
        {
            connection.Open();

            string query = $"SELECT * FROM Placed_Students WHERE universityNum = '{uniNUm}'";
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

        protected void updateButton_Click(object sender, EventArgs e)
        {
            connection = new SqlConnection(ramsConnStr);
            try
            {
                string resName = getResName();

                string resNum = "";

                connection.Open();

                string query = $"SELECT * FROM Residences WHERE resName = '{uniNUm}'";
                command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();

                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    resNum = reader.GetValue(0).ToString();
                }

                reader.Close();
                command.Dispose();

                string str = resNum + dropDblock.SelectedValue.ToString() + " " + dropDroom.SelectedValue.ToString();

                if (resName == "Kumba")
                {
                    string updateK = $"UPDATE Kumba SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updateK, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();

                    string updatePL = $"UPDATE Placed_Students SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updatePL, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();
                }
                else if (resName == "Thuthuka")
                {
                    string updateK = $"UPDATE Thuthuka SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updateK, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();

                    string updatePL = $"UPDATE Placed_Students SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updatePL, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();
                }
                else if (resName == "Jasmyn")
                {
                    string updateK = $"UPDATE Jasmyn SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updateK, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();

                    string updatePL = $"UPDATE Placed_Students SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updatePL, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();
                }
                else if (resName == "Vergelegen")
                {
                    string updateK = $"UPDATE Vergelegen SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updateK, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();

                    string updatePL = $"UPDATE Placed_Students SET room = '{str}' WHERE universityNum = '{uniNUm}'";
                    command = new SqlCommand(updatePL, connection);
                    adapter = new SqlDataAdapter();

                    adapter.InsertCommand = command;
                    adapter.InsertCommand.ExecuteNonQuery();
                }
                connection.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public void update ()
        {
            try
            {
                connection = new SqlConnection(ramsConnStr);

                connection.Open();
                string sql_query = $"SELECT * FROM Placed_Students WHERE universityNum = '{uniNUm}'";
                command = new SqlCommand(sql_query, connection);
                command.ExecuteNonQuery();

                SqlDataReader dataReader;
                dataReader = command.ExecuteReader();

                while (dataReader.Read())
                {
                    lblDescription.Text = dataReader.GetValue(11) + " " + dataReader.GetValue(2) + " " + dataReader.GetValue(3) + " has been placed at residence: " + dataReader.GetValue(1) + ", room number: " + dataReader.GetValue(13);
                }

                dataReader.Close();
                command.Dispose();
                connection.Close();

                string resName = getResName();
                string gender = getGender();

                connection.Open();
                if (resName == "Kumba")
                {
                    string k = "SELECT * FROM Kumba_Rooms WHERE isVacant = 'True'";
                    command = new SqlCommand(k, connection);

                    adapter = new SqlDataAdapter();
                    dataSet = new DataSet();

                    adapter.SelectCommand = command;
                    adapter.Fill(dataSet);

                    residenceRoomsGridView.DataSource = dataSet;
                    residenceRoomsGridView.DataBind();

                    if (gender == "F")
                    {
                        dropDblock.Items.Add("A");
                        dropDblock.Items.Add("B");
                        dropDblock.Items.Add("E");
                        dropDblock.Items.Add("F");
                        dropDblock.Items.Add("J");
                        dropDblock.Items.Add("K");
                        dropDblock.Items.Add("N");
                        dropDblock.Items.Add("P");
                        dropDblock.Items.Add("S");
                        dropDblock.Items.Add("T");
                        dropDblock.Items.Add("W");
                        dropDblock.Items.Add("X");

                        dropDroom.Items.Add("G02");
                        dropDroom.Items.Add("G04");
                        dropDroom.Items.Add("G05");
                        dropDroom.Items.Add("G06");
                        dropDroom.Items.Add("G07");
                        dropDroom.Items.Add("G08");
                        dropDroom.Items.Add("102");
                        dropDroom.Items.Add("104");
                        dropDroom.Items.Add("105");
                        dropDroom.Items.Add("106");
                        dropDroom.Items.Add("107");
                        dropDroom.Items.Add("108");
                    }
                    else if (gender == "M")
                    {
                        dropDblock.Items.Add("C");
                        dropDblock.Items.Add("D");
                        dropDblock.Items.Add("G");
                        dropDblock.Items.Add("H");
                        dropDblock.Items.Add("L");
                        dropDblock.Items.Add("M");
                        dropDblock.Items.Add("Q");
                        dropDblock.Items.Add("R");
                        dropDblock.Items.Add("U");
                        dropDblock.Items.Add("V");

                        dropDroom.Items.Add("G02");
                        dropDroom.Items.Add("G04");
                        dropDroom.Items.Add("G05");
                        dropDroom.Items.Add("G06");
                        dropDroom.Items.Add("G07");
                        dropDroom.Items.Add("G08");
                        dropDroom.Items.Add("102");
                        dropDroom.Items.Add("104");
                        dropDroom.Items.Add("105");
                        dropDroom.Items.Add("106");
                        dropDroom.Items.Add("107");
                        dropDroom.Items.Add("108");
                    }
                }
                else if (resName == "Thuthuka")
                {
                    string k = "SELECT * FROM Thuthuka_Rooms WHERE isVacant = 'True'";
                    command = new SqlCommand(k, connection);

                    adapter = new SqlDataAdapter();
                    dataSet = new DataSet();

                    adapter.SelectCommand = command;
                    adapter.Fill(dataSet);

                    residenceRoomsGridView.DataSource = dataSet;
                    residenceRoomsGridView.DataBind();

                    if (gender == "F")
                    {
                        dropDblock.Items.Add("A");
                        dropDblock.Items.Add("B");
                        dropDblock.Items.Add("C");
                        dropDblock.Items.Add("D");
                        dropDblock.Items.Add("E");
                        dropDblock.Items.Add("F");
                        dropDblock.Items.Add("G");
                        dropDblock.Items.Add("Y");

                        dropDroom.Items.Add("G01 K01");
                        dropDroom.Items.Add("G01 K02");
                        dropDroom.Items.Add("G02 K01");
                        dropDroom.Items.Add("G02 K02");
                        dropDroom.Items.Add("G03 K01");
                        dropDroom.Items.Add("G03 K02");
                        dropDroom.Items.Add("101 K01");
                        dropDroom.Items.Add("101 K02");
                        dropDroom.Items.Add("102 K01");
                        dropDroom.Items.Add("102 K02");
                        dropDroom.Items.Add("103 K01");
                        dropDroom.Items.Add("103 K02");
                    }
                    else if (gender == "M")
                    {
                        dropDblock.Items.Add("L");
                        dropDblock.Items.Add("M");
                        dropDblock.Items.Add("N");
                        dropDblock.Items.Add("O");
                        dropDblock.Items.Add("P");
                        dropDblock.Items.Add("Q");
                        dropDblock.Items.Add("Y");

                        dropDroom.Items.Add("G01 K01");
                        dropDroom.Items.Add("G01 K02");
                        dropDroom.Items.Add("G02 K01");
                        dropDroom.Items.Add("G02 K02");
                        dropDroom.Items.Add("G03 K01");
                        dropDroom.Items.Add("G03 K02");
                        dropDroom.Items.Add("101 K01");
                        dropDroom.Items.Add("101 K02");
                        dropDroom.Items.Add("102 K01");
                        dropDroom.Items.Add("102 K02");
                        dropDroom.Items.Add("103 K01");
                        dropDroom.Items.Add("103 K02");
                    }
                }
                else if (resName == "Jasmyn")
                {
                    string k = "SELECT * FROM Jasmyn_Rooms WHERE isVacant = 'True'";
                    command = new SqlCommand(k, connection);

                    adapter = new SqlDataAdapter();
                    dataSet = new DataSet();

                    adapter.SelectCommand = command;
                    adapter.Fill(dataSet);

                    residenceRoomsGridView.DataSource = dataSet;
                    residenceRoomsGridView.DataBind();

                    SqlDataReader reader;
                    reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        dropDroom.Items.Add(reader.GetValue(1).ToString());
                    }

                    if (gender == "F")
                    {
                        dropDblock.Items.Add("G");
                        dropDblock.Items.Add("H");
                        dropDblock.Items.Add("I");
                        dropDblock.Items.Add("J");
                        dropDblock.Items.Add("L");
                        dropDblock.Items.Add("M");
                        dropDblock.Items.Add("N");
                    }

                    reader.Close();
                    command.Dispose();
                }
                else if (resName == "Vergelegen")
                {
                    string k = "SELECT * FROM Vergelegen_Rooms WHERE isVacant = 'True'";
                    command = new SqlCommand(k, connection);

                    adapter = new SqlDataAdapter();
                    dataSet = new DataSet();

                    adapter.SelectCommand = command;
                    adapter.Fill(dataSet);

                    residenceRoomsGridView.DataSource = dataSet;
                    residenceRoomsGridView.DataBind();

                    SqlDataReader reader;
                    reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        dropDroom.Items.Add(reader.GetValue(1).ToString());
                    }

                    if (gender == "M")
                    {
                        dropDblock.Items.Add("A");
                        dropDblock.Items.Add("B");
                        dropDblock.Items.Add("C");
                        dropDblock.Items.Add("D");
                        dropDblock.Items.Add("E");
                        dropDblock.Items.Add("F");
                    }

                    reader.Close();
                    command.Dispose();

                    connection.Close();
                }

            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                
                while (counter > 0)
                {
                    counter--;
                    insertIntoPlacedStudents();
                }
                uniNUm = tboxStudentNo.Text;
                
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            try
            {
                connection = new SqlConnection(ramsConnStr);
                connection.Open();

                string sqlDel = $"DELETE FROM Place_Students where universityNum = '{tboxStudentNo.Text}";
                command = new SqlCommand(sqlDel, connection);
                command.ExecuteNonQuery();

                connection.Close();
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            
        }

        protected void btnRemoveWaitlist_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    connection = new SqlConnection(ramsConnStr);
            //    connection.Open();

            //   string sqlInsert = "INSERT INTO " + residence + "(universityNum, firstName, lastName, email, phoneNum, gender, nationality, qualification, historicalYear, average, title, hasDisability, room) " +
            //                          "SELECT StudentAppInfo.universityNum, StudentAppInfo.firstName, StudentAppInfo.lastName, StudentAppInfo.email, StudentAppInfo.phoneNum, StudentAppInfo.gender, StudentAppInfo.nationality, StudentAppInfo.qualification, StudentAppInfo.historicalYear, StudentAppInfo.average, StudentAppInfo.title, StudentAppInfo.hasDisability, StudentAppInfo.room FROM StudentAppInfo";
            //    command = new SqlCommand(sqlInsert, connection);
            //    command.ExecuteNonQuery();

            //    connection.Close();

            //    connection.Open();

            //    string sqlDel = $"DELETE FROM Place_Students where universityNum = '{tboxStudentNo.Text}";
            //    command = new SqlCommand(sqlDel, connection);
            //    command.ExecuteNonQuery();

            //    connection.Close();
            //}

            //catch (SqlException ex)
            //{
            //    throw ex;
            //}
        }

        protected void dropDListRemove_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.dropDListRemove.SelectedValue.Equals("Jasmyn"))
            {
                residence = "Jasmyn";
            }
            else if (this.dropDListRemove.SelectedValue.Equals("Kumba"))
                residence = "Kumba";
            else if (this.dropDListRemove.SelectedValue.Equals("Thuthuka"))
                residence = "Thuthuka";
            else
                residence = "Vergelegen";
        }
    }
}
