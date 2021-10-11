<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Thuthuka Room Selection.aspx.cs" Inherits="Res_Admin_Management_System.Thuthuka_Room_Selection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <br />
            <asp:Label ID="welcomeLabel" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Image ID="thuthukaImage" runat="server" ImageUrl="~/images/TF.jpg" />
            <br />
            <br />
            <asp:Label ID="blocksDescriptionLabel" runat="server">Please select a block:</asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="blocksDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="blocksDropDownList_SelectedIndexChanged">
                <asp:ListItem>A</asp:ListItem>
                <asp:ListItem>B</asp:ListItem>
                <asp:ListItem>C</asp:ListItem>
                <asp:ListItem>D</asp:ListItem>
                <asp:ListItem>E</asp:ListItem>
                <asp:ListItem>F</asp:ListItem>
                <asp:ListItem>G</asp:ListItem>
                <asp:ListItem>L</asp:ListItem>
                <asp:ListItem>M</asp:ListItem>
                <asp:ListItem>N</asp:ListItem>
                <asp:ListItem>O</asp:ListItem>
                <asp:ListItem>P</asp:ListItem>
                <asp:ListItem>Q</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:Panel ID="Panel3" runat="server" GroupingText="Ground Floor(G..) &amp; First Floor(1..):" Height="51px" Width="318px">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                </asp:RadioButtonList>
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel>
            <br />
            <br />
            <br />
            <asp:Button ID="chooseButton" runat="server" Height="34px" Text="Choose room" Width="130px" OnClick="chooseButton_Click" />
        </div>
    </form>
</body>
</html>
