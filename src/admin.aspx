<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="RAMS.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/admin.css" />
    <script src="js/sidebar.js"></script>
    <script src="js/sidebar.js"></script>
    <href="https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css" rel="stylesheet"/>
    <title>Admin Panel</title>
</head>
<body>
    <form id="formAdmin" runat="server">
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
            <i
              class="bx bx-message-rounded-dots"
              onclick="openCity(event, 'student-requests')"
            ></i>
            <span
              class="links-name"
              onclick="openCity(event, 'student-requests')"
              >Requests</span
            >
          </a>
          <span class="tooltip">Request</span>
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
            <!-- <i class='bx bxs-user-check' ></i> -->
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
        <select>
          <option value="1">Jasmyn</option>
          <option value="2">Horizon</option>
          <option value="3">Kumbah</option>
          <option value="4">Thuthuka</option>
          <option value="5">Vergelegen</option>
        </select>
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
        <label id="	lblStudentPlaced" for="tboxStudentPlaced">Enter student number:</label>
        <input type="text" id="tboxStudentPlaced" class="tbox" />
        <button type="submit" id="btnDelete" class="btn btnDelete">
          Remove
        </button>
        <button type="submit" id="btnUpdate" class="btn btnUpdate">
          Update
        </button>
      </div>
      <div>
        <label for="waitinglist-table">Students In Waiting List</label>
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
        <div></div>
      </div>
    </div>

    <div id="add-student" class="tabcontent">
      <h1>Add Student</h1>
      <div>
        <h2>Available Rooms in Residences</h2>
        <div>
          <label>Residence</label>
          <select>
            <option value="1">Jasmyn</option>
            <option value="2">Horizon</option>
            <option value="3">Kumbah</option>
            <option value="4">Thuthuka</option>
            <option value="5">Vergelegen</option>
          </select>
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
          <fieldset>
            <legend>Student Information</legend>
            <label id="lblAdd" for="tboxAdd">Student Number</label>
            <input type="text" id="tboxAdd" />
          </fieldset>
          <fieldset>
            <legend>Residence</legend>
            <label id="lblCurrRes" for="tboxCurrRes"
              >Current Year Residence</label
            >
            <select>
              <option value="1">Jasmyn</option>
              <option value="2">Horizon</option>
              <option value="3">Kumbah</option>
              <option value="4">Thuthuka</option>
              <option value="5">Vergelegen</option>
            </select>
            <!-- <input type="text" id="tboxCurrRes"> -->
            <label id="lblNextRes" for="tboxNextRes">Next Year Residence</label>
            <select>
              <option value="1">Jasmyn</option>
              <option value="2">Horizon</option>
              <option value="3">Kumbah</option>
              <option value="4">Thuthuka</option>
              <option value="5">Vergelegen</option>
            </select>
            <!-- <input type="text" id="tboxNextRes"> -->
            <input type="radio" name="singleOrSharing" id="rbtSharing" />
            <label for="rbtSharing">Sharing</label>
            <input type="radio" name="singleOrSharing" id="rbtSingle" />
            <label for="rbtSingle">Single</label>
          </fieldset>
          <div>
            <button type="submit" id="btnAdd" class="btn">Add Stundet</button>
          </div>
        </div>
      </div>
    </div>
    <div id="publish-info" class="tabcontent">
      <div class="publish">
        <h1>Publish Info</h1>
        <div>
          <label id="lblTxtArea" for="txtAreaInfo"
            >Enter Information to publish:</label>
          <div>
            <textarea id="txtAreaPublish" rows="15" cols="120"></textarea>
            <div>
              <button>Publish</button>
            </div>
          </div>
        </div>
      </div>
      <div class="students-requests">
        <h1>Requests</h1>
        <div>
          <label>Students that Requested to cancel their room / placement</label>
          <div class="request-box"></div>
        </div>
      </div>
    </div>

    <!-- <section class="tabcontent">
      <nav>
        <div>
          <span class="dashboard">Dashboard</span>
        </div>
      </nav>
    </section>
    <section class="home-section">
      <nav>
        <div>
          <span class="place-students">Place Students</span>
        </div>
      </nav>
    </section>
    <section class="home-section">
      <nav>
        <div>
          <span class="add-student">Add Student</span>
        </div>
      </nav>
    </section>
    <section class="home-section">
      <nav>
        <div>
          <span class="request">Requests</span>
        </div>
      </nav>
    </section>
    <section class="home-section">
      <nav>
        <div>
          <span class="publish">Publish Information</span>
        </div>
      </nav>
    </section> -->
        </div>
    </form>
</body>
</html>
