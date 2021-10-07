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
        <table class="residence-table">
          <thead>
            <tr>
              <th>Student Number</th>
              <th>Full Names</th>
              <th>Title</th>
              <th>Email</th>
              <th>Phone Number</th>
              <th>Gender</th>
              <th>Qualification</th>
              <th>Average</th>
              <th>Hist. Year</th>
              <th>Nationality</th>
              <th>Registered</th>
              <th>Has Disability</th>
              <th>Room Selected</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>32466527</td>
              <td>Matsobane Setlatjile</td>
              <td>Mr.</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>M</td>
              <td>BSc. Info-Tech</td>
              <td>71</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td>30D G06</td>
            </tr>
            <tr class="active-row">
              <td>32466527</td>
              <td>Thabang Ngakane</td>
              <td>Mr.</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>M</td>
              <td>B.ed FET</td>
              <td>79</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td>30D G06</td>
            </tr>
            <tr>
              <td>32466527</td>
              <td>Nhlanhla Nhlapho</td>
              <td>Miss</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>F</td>
              <td>BCom. Accounting (FA)</td>
              <td>69</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td>30D G06</td>
            </tr>
            <tr>
              <td>374007527</td>
              <td>Molefe Sebete</td>
              <td>Mrs.</td>
              <td>shakes59@gmail.com</td>
              <td>0823336577</td>
              <td>F</td>
              <td>BA. Psychology</td>
              <td>80</td>
              <td>Fourth</td>
              <td>Zimbabwe</td>
              <td>Yes</td>
              <td>No</td>
              <td>15N 102</td>
            </tr>
          </tbody>
        </table>
          <asp:Label ID="lblStudentPlaced" for="tboxStudentPlaced" runat="server" Text="Enter student number:"></asp:Label>
            <asp:TextBox ID="tboxStudentPlaced" runat="server" class="tbox"></asp:TextBox>
          <asp:Button ID="btnRemove" runat="server" Text="Remove" class="btn btnRemove"/>
          <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btnUpdate"/>
      </div>
      <div>
          <div>
              <p>Students In Waiting List</p>
          </div>
        <table class="residence-table">
          <thead>
            <tr>
              <th>Student Number</th>
              <th>Full Names</th>
              <th>Title</th>
              <th>Email</th>
              <th>Phone Number</th>
              <th>Gender</th>
              <th>Qualification</th>
              <th>Number of Credits</th>
              <th>Average</th>
              <th>Hist. Year</th>
              <th>Nationality</th>
              <th>Registered</th>
              <th>Has Disability</th>
              <th>Room Selected</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>32466527</td>
              <td>Papi Malek</td>
              <td>Mr.</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>M</td>
              <td>BSc. Info-Tech</td>
              <td>46</td>
              <td>66</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td></td>
            </tr>
            <tr>
              <td>32466527</td>
              <td>Khanisile Ndweni</td>
              <td>Mr.</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>M</td>
              <td>B.ed FET</td>
              <td>50</td>
              <td>65</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td></td>
            </tr>
            <tr>
              <td>32466527</td>
              <td>Naam Vaan</td>
              <td>Miss</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>F</td>
              <td>BCom. Accounting (FA)</td>
              <td>50</td>
              <td>69</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td></td>
            </tr>
            <tr>
              <td>374007527</td>
              <td>Thabo Next</td>
              <td>Mrs.</td>
              <td>shakes59@gmail.com</td>
              <td>0823336577</td>
              <td>F</td>
              <td>BA. Psychology</td>
              <td>46</td>
              <td>67</td>
              <td>Fourth</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td></td>
            </tr>
          </tbody>
        </table>
        <label for="btnRemoveFromWaitingList">Enter Student Number:</label>
        <input type="text" id="	lblWaitListStudent" />
        <button id="btnRemoveWaitlist" class="waiting-list-btn">Move to</button>
      </div>
    </div>

    <div id="place-students" class="tabcontent">
      <h1>Place Students</h1>
      <div>
        <table class="table residence-table">
          <thead>
            <tr>
              <th>Student Number</th>
              <th>Full Names</th>
              <th>Title</th>
              <th>Email</th>
              <th>Phone Number</th>
              <th>Gender</th>
              <th>Qualification</th>
              <th>Average</th>
              <th>Hist. Year</th>
              <th>Nationality</th>
              <th>Registered</th>
              <th>Has Disability</th>
              <th>First Choice</th>
              <th>Second Choice</th>
              <th>Third Choice</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>32466527</td>
              <td>Matsobane Setlatjile</td>
              <td>Mr.</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>M</td>
              <td>BSc. Info-Tech</td>
              <td>71</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td>Kumba</td>
              <td>Vergelegen</td>
              <td>Thuthuka</td>
            </tr>
            <tr class="active-row">
              <td>32466527</td>
              <td>Thabang Ngakane</td>
              <td>Mr.</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>M</td>
              <td>B.ed FET</td>
              <td>79</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td>Thuthuka</td>
              <td>Vergelegen</td>
              <td>Kumba</td>
            </tr>
            <tr>
              <td>32466527</td>
              <td>Nhlanhla Nhlapho</td>
              <td>Miss</td>
              <td>elias@gmail.com</td>
              <td>0720936577</td>
              <td>F</td>
              <td>BCom. Accounting (FA)</td>
              <td>69</td>
              <td>Second</td>
              <td>South Africa</td>
              <td>Yes</td>
              <td>No</td>
              <td>Kumba</td>
              <td>Jasmyn</td>
              <td>Thuthuka</td>
            </tr>
            <tr>
              <td>374007527</td>
              <td>Molefe Sebete</td>
              <td>Mrs.</td>
              <td>shakes59@gmail.com</td>
              <td>0823336577</td>
              <td>F</td>
              <td>BA. Psychology</td>
              <td>80</td>
              <td>Fourth</td>
              <td>Zimbabwe</td>
              <td>Yes</td>
              <td>No</td>
              <td>Horizon</td>
              <td>Jasmyn</td>
              <td>Thuthuka</td>
            </tr>
          </tbody>
        </table>
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
            <table class="residence-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Block</th>
                  <th>Room Number</th>
                  <th>Is Vacant</th>
                  <th>Single/Sharing</th>
                  <th>Number of Students</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>A</td>
                  <td>G02</td>
                  <td>Yes</td>
                  <td>Single</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>A</td>
                  <td>G04</td>
                  <td>Yes</td>
                  <td>Single</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>A</td>
                  <td>G05</td>
                  <td>Yes</td>
                  <td>Single</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>A</td>
                  <td>G06</td>
                  <td>Yes</td>
                  <td>Sharing</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>A</td>
                  <td>G07</td>
                  <td>Yes</td>
                  <td>Sharing</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td>6</td>
                  <td>A</td>
                  <td>G08</td>
                  <td>Yes</td>
                  <td>Sharing</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td>7</td>
                  <td>A</td>
                  <td>102</td>
                  <td>Yes</td>
                  <td>Single</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>8</td>
                  <td>A</td>
                  <td>104</td>
                  <td>Yes</td>
                  <td>Single</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>9</td>
                  <td>A</td>
                  <td>105</td>
                  <td>Yes</td>
                  <td>Single</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td>10</td>
                  <td>A</td>
                  <td>106</td>
                  <td>Yes</td>
                  <td>Sharing</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td>11</td>
                  <td>A</td>
                  <td>107</td>
                  <td>Yes</td>
                  <td>Sharing</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td>11</td>
                  <td>A</td>
                  <td>108</td>
                  <td>Yes</td>
                  <td>Sharing</td>
                  <td>2</td>
                </tr>
              </tbody>
            </table>
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
