<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="RAMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/login.css" />
    <title></title>
</head>
<body>
    <form id="formLogin" runat="server">
        <div>
            <div class="container">
      <div class="box box1">
        <p>
          Residence Administration <br />
          Management System
        </p>
      </div>
      <div class="box box2">
        <div class="login-icon">
          <box-icon name="user-circle" type="solid">
            <img
              src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAAXNSR0IArs4c6QAABHNJREFUaEPtWv9VGzEMlrJAYYLCBIUJSieATlCYoPYtQFjg5E4ATFA6QcMEJRMUJmhYIOpTnq8vJHfnH/KFvBK/l79ytvRZkvVJNsIbG/jG8MIO8P9u8Z2FS1rYGLOHiKfMfICIJwBw4H/LYh4B4JGZJ4j4wMz3zrlZST2W1ypuYQ/yCwCcA8BRpuIPAOCY+Udp8MUAG2PEepeIKECLDWa+AYAr55x4gnoUAWyMEaBjtTY9CzDz2Dl3pZWhAmyMOULE7y1xqdWra77E+mfnnLh81sgGbK39KnGWJVU/yRDRt5xlsgAbY65Lx2qq8hLbzrmL1HnJgLcBbAMyB3QS4G0Cmws6GnBVVYaZKdWFNvE9Itq6rqPOkyjA/jT+tQnlc2Uw83HM6R0F2Fr7e4OpJxfzIxEdhiYHAVdVNWbmy9BCkf8/A8CCM8v3zCzUUzj2u8j5vZ8h4lVd170EqBew0EVEFOtqx5MwsbquhSaujaqqzoVJAcB7rSBmPuyjob2ArbWioBQCmjFl5pNQEeCLjgkAfNAIA4BbIurk852AvQJ/lMKfxG1DYBsZXqa4u8bSM2/l1hKzE7B3s2sNYES86HLjrnWHltsJ2ForaSi3nhU8z0S0l7Nh1lqxjuYgeyCi4zbZrYALufMPIjrLBHwHAKc5c5s5zLzfFkqtgAu5VTBF9Li1OhX6MlI27sXoAqwWGJMThwTcJb8VsLVW0sNHjUuF0kPf2tZatUsDwD0RCakJW7gQlZwR0X7OpllrJR1mHXhL8loPri4Lc46ia7v5Smmp0YOI1vANCtj3m6WKieoz++wg6VA6oOrxG
              oBFaWmufwqB9mB/KnP/i016LcCihPSUx0R022Y2a63wdSkeilg2x6VFQQ2f7XLHGSJO5vP5ojwcjUZHUlgUOKDa5E2JaI0pDpmW1DGoXCA+LRUu+pV6501PIh4lqGWemuVmJVHLQsVDo/0UABax2wdnKZa1DYCFmKTiQSZYa+VgyRUuvas7ZnYxncTljfAdUgMAUmnlloitB5bI6WsA5Pah75n5LJR3Q87rvUw4dTKn72s8FG3xpDTEQ4Cb/zMuAJ7lxUHXhhdr4g0BNhN0XhNPhCW0aXuFxFqz77vYDqqqTSsKRObkKL6cCzyWZ8c0HYI3D/7EjqGa6tv5tg1JeGXwRERBLh4FOOEyTcpAuZ1vLRJSLeyLCrkVDDYDil6meddOSVPi4tY510s2ujbAGHOCiHI1G9UmTjkwoyzcKBZ7cCwBEfJy499b9T478gektGZT33clHZhJgH085943LV7cIeJspTwUd217oRcTAUlge5lWiRQRo7Him2Sw2YAzYlqBa31qSsyuzk526RaiL3x3iO5I2ybJbaTw9M0/TFvWJpKcqKwcQypiBKgsvGJteS0gjThNWbeqc1NmyjvL7XlcugJ8bzQanTGz1LS59fQUEd18Pr/TlplFYzjkQsKB5dHKSndydRP+dUR8upqUBrmsZzGXDoHflv93gLfFEkPpsbPwUDu7Lev+BY3XVFtfjP6RAAAAAElFTkSuQmCC"
              class="user-icon"
            />
          </box-icon>
          <!-- <p style="color: lightgray;"> fsssf</p>
          </div>
          <div>
            <p style="color: lightgray;"> fsssf</p>
          </div>
          <div>
            <p style="color: lightgray;"> fsssf</p> -->
        </div>

        <div>
          <label
            id="lblUsername"
            class="username"
            type="text"
            style="margin-top: 10px"
            >Username:<br
          /></label>
        </div>
        <div><input id="tboxUsername" class="textbox-username" /><br /></div>
        <div>
          <label id="lblPassword" class="password">Password:<br /></label>
        </div>
        <div>
          <input type="text" id="tboxPasword" class="textbox-password" /></div>
        <div>
          <button type="button" id="btnLogin" class="button-login">Login</button>
        </div>
        <div id="cboxRemember"><input type="checkbox" class="rember-me" />Remember me</div>
      </div>
    </div>
        </div>
    </form>
</body>
</html>
