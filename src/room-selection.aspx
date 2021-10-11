<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="room-selection.aspx.cs" Inherits="RAMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/room-selection.css" />
    <title>Room Selection</title>
</head>
<body>
    <form id="formRoomSelection" runat="server" draggable="false">
        <div>
            <div class="grid-container">
      <div class="header">
        <div>
          <!-- <button type="button">Back</button> -->
          <h1>Room Selection</h1>
          <div></div>
        </div>
      </div>
      <div class="content">
        <div class="box box-one">
          <!-- <div class="circle"></div> -->
          <asp:Label ID="lblPlacedAt" runat="server" Text="You are placed at"></asp:Label>
            <asp:Label ID="lblResName" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
          <h2>Check the floor plan below before choosing a room:</h2>
        </div>
        <div class="box box-two">
          <img src="images/k-floor.jpg" class="floor-img" />
        </div>
        <div>
            <div>
                <h2 class="h2-block">Female Blocks:</h2>
            <asp:DropDownList ID="dropDListBlockF" runat="server" AutoPostBack="True">
                <asp:ListItem>A</asp:ListItem>
                <asp:ListItem>B</asp:ListItem>
                <asp:ListItem>AB</asp:ListItem>
                <asp:ListItem>AC</asp:ListItem>
                <asp:ListItem>E</asp:ListItem>
                <asp:ListItem>F</asp:ListItem>
                <asp:ListItem>J</asp:ListItem>
                <asp:ListItem>K</asp:ListItem>
                <asp:ListItem>N</asp:ListItem>
                <asp:ListItem>P</asp:ListItem>
                <asp:ListItem>S</asp:ListItem>
                <asp:ListItem>T</asp:ListItem>
                <asp:ListItem>W</asp:ListItem>
                <asp:ListItem>X</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <h2 class="h2-block">Male Blocks:</h2>
            <asp:DropDownList ID="dropDListM" runat="server" AutoPostBack="True">
                <asp:ListItem>C</asp:ListItem>
                <asp:ListItem>D</asp:ListItem>
                <asp:ListItem>G</asp:ListItem>
                <asp:ListItem>H</asp:ListItem>
                <asp:ListItem>L</asp:ListItem>
                <asp:ListItem>M</asp:ListItem>
                <asp:ListItem>Q</asp:ListItem>
                <asp:ListItem>R</asp:ListItem>
                <asp:ListItem>U</asp:ListItem>
                <asp:ListItem>V</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div>
          <h2 class="rooms">Rooms available:</h2>
        </div>
        <!-- <div class="box box-three">
          
        </div> -->
        <div class="floor ground-floor">
          <h2>Ground floor:</h2>
          <div class="single-rooms">
            <h3>Singles:</h3>
            <asp:RadioButton ID="rbtnG02" runat="server" Text="G02" GroupName="rooms" />
              <asp:RadioButton ID="rbtnG04" runat="server" Text="G04" GroupName="rooms" />
              <asp:RadioButton ID="rbtnG05" runat="server" Text="G05" GroupName="rooms" />
          </div>
          <div class="sharing-rooms">
            <h3>Sharing:</h3>
              <asp:RadioButton ID="rbtnG06" runat="server" Text="G06" GroupName="rooms" />
              <asp:RadioButton ID="rbtnG07" runat="server" Text="G07" GroupName="rooms" />
              <asp:RadioButton ID="rbtnG08" runat="server" Text="G08" GroupName="rooms" />
          </div>
        </div>
        <div class="floor first-floor">
          <h2>First floor:</h2>
          <div class="single-rooms">
            <h3>Singles:</h3>
              <asp:RadioButton ID="rbtn102" runat="server" Text="102" GroupName="rooms" />
              <asp:RadioButton ID="rbtn104" runat="server" Text="104" GroupName="rooms" />
              <asp:RadioButton ID="rbtn105" runat="server" Text="105" GroupName="rooms" />
          </div>
          <div class="sharing-rooms">
            <h3>Sharing:</h3>
              <asp:RadioButton ID="rbtn106" runat="server" Text="106" GroupName="rooms" />
              <asp:RadioButton ID="rbtn107" runat="server" Text="107" GroupName="rooms" />
              <asp:RadioButton ID="rbtn108" runat="server" Text="108" GroupName="rooms" />
          </div>
        </div>
        <div>
            <asp:Button ID="btnChoose" runat="server" Text="Button" class="btn-choose" />
        </div>
      </div>
      <!-- <div class="footer"></div> -->
    </div>
        </div>
    </form>
</body>
</html>
