<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="RAMS.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/admin.css" />
    <href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet"/>
    <title>Admin Panel</title>
</head>
<body>
    <form id="formAdmin" runat="server" draggable="true">
        <div>
            <div class="sidebar">
      <div class="logo-content">
        <div class="logo">
          <div class="logo-name">R.A.M.S</div>
        </div>
        <i class="bx bx-menu" id="btn"></i>

      </div>
      <ul class="nav-list">
        <li>
          <a href="#">
            <i class="bx bx-search-alt-2"></i>
            <input type="text" placeholder="Search student..." />
          </a>
          <span class="tooltip">Search</span>
        </li>
        <li>
          <a href="#">
            <i
              class="bx bx-grid-alt"
              onclick="openCity(event, 'dashboard')"
            ></i>
            <class="links-name" onclick="openCity(event, 'dashboard')"
              >Dashboard</>
          </a>
          <span class="tooltip">Dashboard</span>
        </li>
        <li>
          <a href="#">
            <i
              class="bx bx-user-plus"
              onclick="openCity(event, 'place-students')"
            ></i>
            <span class="links-name" onclick="openCity(event, 'place-students')"
              >Place Students</span
            >
          </a>
          <span class="tooltip">Place Students</span>
        </li>
        <li>
          <a href="#">
            <i
              class="bx bx-user-plus"
              onclick="openCity(event, 'add-student')"
            ></i>
            <span class="links-name" onclick="openCity(event, 'add-student')"
              >Add Student</span
            >
          </a>
          <span class="tooltip">Add Student</span>
        </li>
        
        <li>
          <a href="#">
            <i class="bx bx-send" onclick="openCity(event, 'Update-Student')"></i>
            <span class="links-name" onclick="openCity(event, 'Update-Student')"
              >Update-Student</span
            >
          </a>
          <span class="tooltip">Publish Info</span>
        </li>
      </ul>
      <div class="profile-content">
        <div class="profile">
          <div class="profile-details">
            <img src="images/admin.png" alt="" />
            <div class="admin">
              <div class="name">Setjhaba Klass</div>
              <div class="admin-type">Admin</div>
            </div>
          </div>
          <i class="bx bx-log-out" id="logout"></i>
        </div>
      </div>
    </div>

    <!-- Home-content -->
    <div id="dashboard" class="tabcontent">
      <div>
        <h1>Dashboard</h1>
      </div>
      <div>
        <label> Select residence: </label>
          <asp:DropDownList ID="dropDListRes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropDListRes_SelectedIndexChanged" DataSourceID="Residences" DataTextField="resName" DataValueField="resName">
          </asp:DropDownList>
      </div>
      <div>
        <label for="residence-table">Students Placed At ...</label>
          <asp:GridView ID="gridViewStudentsPlaced" runat="server" class="residence-table"></asp:GridView>
            <div>
                <asp:Label ID="lblPlaced" runat="server" Text="Enter Student Number:"></asp:Label>
                    <asp:TextBox ID="tboxStudentNo" runat="server" class="tbox" display="inline"></asp:TextBox>
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" class="btn" OnClick="btnRemove_Click"/>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn" OnClick="btnUpdate_Click"/>
                <div>
          
      </div>
            </div>
      </div>
        <div>
            <h2>Students in waiting list</h2>
            <div>
                <asp:GridView ID="gridViewWaitingList" runat="server" class="residence-table" ></asp:GridView>
                <div>
                    <asp:Label ID="lblWList" for="btnRemoveFromWaitingList" runat="server" Text="Enter Student Number:"></asp:Label>
                    <asp:TextBox ID="tboxRemoveWaitlist" runat="server" class="tbox"></asp:TextBox>
                    <div>
                        <asp:Label ID="lblMoveTo" for="dropDListRemove" runat="server" Text="Move to:"></asp:Label>
                        <asp:DropDownList ID="dropDListRemove" runat="server" AutoPostBack="True" DataSourceID="Residences" DataTextField="resName" DataValueField="resName" OnSelectedIndexChanged="dropDListRemove_SelectedIndexChanged"></asp:DropDownList>
                        <div>
                            <asp:Button ID="btnRemoveWaitlist" runat="server" Text="Place out" class="btn waiting-list-btn" OnClick="btnRemoveWaitlist_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="place-students" class="tabcontent">
      <h1>Place Students</h1>
      <div>
        
          <div class="place-controls">
          <div class="rbtn">
              <div>
                  
                  <div>
                      <asp:GridView ID="gridViewPlace" runat="server" class="residence-table"></asp:GridView>
                  </div>
              </div>
              <p>Place students to their residence of choice:</p>
            <div>
                <asp:Button ID="btnJasmyn" runat="server" Text="Jasmyn" class="btn" OnClick="btnJasmyn_Click"/>
                   <asp:Button ID="btnKumba" runat="server" Text="Kumba" class="btn" OnClick="btnKumba_Click"/>
                   <asp:Button ID="btnThuthuka" runat="server" Text="Thuthuka" class="btn" OnClick="btnThuthuka_Click"/>
                   <asp:Button ID="btnVergelegen" runat="server" Text="Vergelegen" class="btn" OnClick="btnVergelegen_Click"/>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="add-student" class="tabcontent">
      <h1>Add Student</h1>
      <div>
        <h2>Student from VSS</h2>
        <div>

            <div>
                <asp:SqlDataSource ID="Residences" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\System_DB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [resName] FROM [Residences]"></asp:SqlDataSource>
            </div>
          <div>
            <asp:GridView ID="gridViewAddStudent" runat="server" class="residence-table"></asp:GridView>
          </div>
        </div>
        <div>
            <h3>Student Information</h3>
            <asp:Label ID="lblAdd" for="tboxAdd" runat="server" Text="Student Number"></asp:Label>
            <asp:TextBox ID="tboxAdd" runat="server" class="tbox"></asp:TextBox>
            <div>
                <div>
                    <asp:Label ID="lblNextRes" for="dropDListNext" runat="server" Text="Next Year Residence"></asp:Label>
                    <asp:DropDownList ID="dropDListNext" runat="server" AutoPostBack="True"> </asp:DropDownList>
                </div>
                
            </div>
          <div>
              <asp:Button ID="btnAdd2" runat="server" Text="Add" class="btn" OnClick="btnAdd2_Click"/>
          </div>
        </div>
      </div>
    </div>

    <div id="Update-Student" class="tabcontent">
        <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
          <div>
              <asp:GridView ID="residenceRoomsGridView" runat="server"></asp:GridView>
              <div><asp:Label ID="lblBlock" for="dropDblock" runat="server" Text="Blocks:"></asp:Label>
                  <asp:DropDownList ID="dropDblock" runat="server" AutoPostBack="True"></asp:DropDownList>
                  <div>
                      <asp:Label ID="lblRoom" for="dropDRoom" runat="server" Text="Rooms:"></asp:Label>
                      <asp:DropDownList ID="dropDroom" runat="server" AutoPostBack="True"></asp:DropDownList>
                      <div>
                          <asp:Button ID="btnUpadte2" runat="server" OnClick="updateButton_Click" Text="Update" />
                      </div>
                  </div>
              </div>
          </div>
    </div>
   </div>
    </form>
</body>
    <script>
        let btn = document.querySelector("#btn");
        let sidebar = document.querySelector(".sidebar");
        let searchBtn = document.querySelector(".bx-search-alt-2");
        //let dashboard = documnet.querySelector(".dashboard");

        btn.onclick = function () {
            sidebar.classList.toggle("active");
        };

        searchBtn.onclick = function () {
            sidebar.classList.toggle("active");
        };

        function openCity(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }

    </script>
</html>
