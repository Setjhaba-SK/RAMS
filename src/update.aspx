<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="RAMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/admin.css" />
    <title></title>
</head>
<body>
    <form id="formUpdate" runat="server" draggable="false">
        <div>
            <div class="update-container">
      <div class="table-container">
        <div>
          <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblNames" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblMessage" runat="server" Text="is placed at"></asp:Label>
            <asp:Label ID="lblResidenceName" runat="server" Text=""></asp:Label>
          <div>
            <h2>Available in residences:</h2>
            <div>
                <asp:Label ID="lblResidence" runat="server" Text="Residence:"></asp:Label>
              <asp:DropDownList ID="dropDlistRes" runat="server" AutoPostBack="True"></asp:DropDownList>
              <div>
                <asp:GridView ID="gridViewUpdate" runat="server" class="residence-table"></asp:GridView>
              </div>
            </div>
            
          </div>
        </div>
      </div>
      <div class="ctrl-container">
          <div>
              <div>
                  <asp:Label ID="lblBlockF" runat="server" Text="Female Blocks:"></asp:Label>
            <asp:DropDownList ID="dropDlistBlockFemales" runat="server" AutoPostBack="True"></asp:DropDownList>
              </div>
              <div>
                <asp:Label ID="lblBlockM" runat="server" Text="Male Blocks:"></asp:Label>
              <asp:DropDownList ID="dropDlistBlockMales" runat="server" AutoPostBack="True"></asp:DropDownList>
              </div>
          </div>
          <div>
              <asp:Label ID="lblRoomNo" runat="server" Text="Room number:"></asp:Label>
              <div>
                  <asp:Label ID="lblGF" runat="server" Text="Ground floor:"></asp:Label>
                  <asp:DropDownList ID="dropDListGF" runat="server" AutoPostBack="True"></asp:DropDownList>
              </div>
              <div>
                    <asp:Label ID="lblFF" runat="server" Text="First floor:"></asp:Label>
                  <asp:DropDownList ID="dropDListFF" runat="server" AutoPostBack="True"></asp:DropDownList>
              </div>
          </div>
          <div>
              <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn"/>

          </div>
      </div>
    </div>
        </div>
    </form>
</body>
</html>
