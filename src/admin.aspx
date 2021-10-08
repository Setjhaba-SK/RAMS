<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="RAMS.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/admin.css" />
    <script src="js/sidebar.js"></script>
    <script src="js/tabs.js"></script>
    <href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet"/>
    <title>Admin Panel</title>
</head>
<body>
    <form id="formAdmin" runat="server" draggable="false">
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
            <span class="links-name" onclick="openCity(event, 'dashboard')"
              >Dashboard</span
            >
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
            <i class="bx bx-send" onclick="openCity(event, 'publish-info')"></i>
            <span class="links-name" onclick="openCity(event, 'publish-info')"
              >Publish Info</span
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
          <asp:DropDownList ID="dropDListRes" runat="server" AutoPostBack="True"></asp:DropDownList>
      </div>
      <div>
        <label for="residence-table">Students Placed At ...</label>
          <asp:GridView ID="gridViewStudentsPlaced" runat="server" class="residence-table"></asp:GridView>
            <div>
                <asp:Label ID="lblPlaced" runat="server" Text="Enter Student Number:"></asp:Label>
                    <asp:TextBox ID="tboxStudentNo" runat="server" class="tbox"></asp:TextBox>
                    <asp:Button ID="btnRemove" runat="server" Text="Remove" class="btn"/>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn"/>
            </div>
      </div>
        <div>
            <h2>Students in waiting list</h2>
            <div>
                <asp:GridView ID="gridViewWaitingList" runat="server" class="residence-table"></asp:GridView>
                <div>
                    <asp:Label ID="lblWList" for="btnRemoveFromWaitingList" runat="server" Text="Enter Student Number:"></asp:Label>
                    <asp:TextBox ID="tboxRemoveWaitlist" runat="server" class="tbox"></asp:TextBox>
                    <asp:Button ID="btnRemoveWaitlist" runat="server" Text="Place Out" class="btn waiting-list-btn"/>
                </div>
            </div>
        </div>
    </div>

    <div id="place-students" class="tabcontent">
      <h1>Place Students</h1>
      <div>
        <asp:GridView ID="gridViewPlace" runat="server" class="residence-table"></asp:GridView>
          <div class="place-controls">
          <div class="rbtn">
              <div>
                  <p>Place ALL students to their residence of choice</p>
                  <asp:RadioButton ID="rbtnAll" runat="server" Text="All Residences" />
              </div>
              <div>
                  <p>Place specific student to specific residence</p>
                  <div>
                      <asp:RadioButton ID="rbtnH" runat="server" Text="Horizon" class="rbtn"/>
                      <asp:RadioButton ID="rbtnJ" runat="server" Text="Jasmyn" class="rbtn"/>
                      <asp:RadioButton ID="rbtnK" runat="server" Text="Kumba" class="rbtn"/>
                      <asp:RadioButton ID="rbtnT" runat="server" Text="Thuthuka" class="rbtn"/>
                      <asp:RadioButton ID="rbtnV" runat="server" Text="Vergelegen" class="rbtn"/>
                  </div>
              </div>
            <div>
                <asp:Button ID="btnSubmit" runat="server" Text="Place" class="btn"/>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="add-student" class="tabcontent">
      <h1>Add Student</h1>
      <div>
        <h2>Available Rooms in Residences</h2>
        <div>
          <p>Residence</p>
            <div>
                <asp:DropDownList ID="dropDlistRes2" runat="server" AutoPostBack="True"></asp:DropDownList>
            </div>

          <div>
            <asp:GridView ID="gridViewAddStudent" runat="server" class="residence-table"></asp:GridView>
          </div>
        </div>
        <div>
            <h3>Student Information</h3>
            <asp:Label ID="lblAdd" for="tboxAdd" runat="server" Text="Student Number"></asp:Label>
            <br />
            <asp:TextBox ID="tboxAdd" runat="server" class="tbox"></asp:TextBox>
            <br />
            <div>
                <p>Residence</p>
                <div>
                    <asp:Label ID="lblCurrRes" for="dropDList3" runat="server" Text="Current Residences"></asp:Label>
                <asp:DropDownList ID="dropDList3" runat="server" AutoPostBack="True"></asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="lblNextRes" for="dropDList4" runat="server" Text="Next Year Residence"></asp:Label>
                    <asp:DropDownList ID="dropDList4" runat="server" AutoPostBack="True"></asp:DropDownList>
                     <br />
                </div>
                <div>
                    <asp:RadioButton ID="rbtnSharing" runat="server" Text="Sharing" class="rbtn"/>
                    <asp:RadioButton ID="rbtSingle" runat="server" Text="Single" class="rbtn"/>
                </div>
            </div>
          <div>
              <asp:Button ID="btnAdd2" runat="server" Text="Add" class="btn"/>
          </div>
        </div>
      </div>
    </div>
    <div id="publish-info" class="tabcontent">
      <div class="publish">
        <h1>Publish Info</h1>
        <div>
            <asp:Label ID="lblTxtArea" for="txtAreaInfo" runat="server" Text="Enter Information to publish:"></asp:Label>
            <br />
          <div>
              <textarea id="txtAreaPublish" rows="15" cols="120" name="S1"></textarea>
            <div>
              <asp:Button ID="btnPublish" runat="server" Text="Publish" class="btn"/>
            </div>
          </div>
        </div>
      </div>
      <div class="students-requests">
        <h1>Requests</h1>
        <div>
          <p>Students that Requested to cancel their room / placement</p>
          <div class="request-box"></div>
        </div>
      </div>
    </div>
   </div>
    </form>
    <script>
      let btn = document.querySelector("#btn");
      let sidebar = document.querySelector(".sidebar");
      let searchBtn = document.querySelector(".bx-search-alt-2");

      btn.onclick = function () {
        sidebar.classList.toggle("active");
      };

      searchBtn.onclick = function () {
        sidebar.classList.toggle("active");
      };

      function open(evt, tabName) {
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
</body>
</html>
