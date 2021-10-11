<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kumba Room Selections.aspx.cs" Inherits="Res_Admin_Management_System.Kumba_Room_Selections" %>

&nbsp;

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
            <br />
            <asp:Label ID="welcomeLabel" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Image ID="kumbaImage" runat="server" ImageUrl="~/images/KF.jpg" />
            <br />
            <asp:Label ID="blockDescriptionLabel" runat="server">Please select a block:</asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="blocksDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="blocksDropDownList_SelectedIndexChanged">
                <asp:ListItem>A</asp:ListItem>
                <asp:ListItem>B</asp:ListItem>
                <asp:ListItem>C</asp:ListItem>
                <asp:ListItem>D</asp:ListItem>
                <asp:ListItem>E</asp:ListItem>
                <asp:ListItem>F</asp:ListItem>
                <asp:ListItem>G</asp:ListItem>
                <asp:ListItem>H</asp:ListItem>
                <asp:ListItem>J</asp:ListItem>
                <asp:ListItem>K</asp:ListItem>
                <asp:ListItem>L</asp:ListItem>
                <asp:ListItem>M</asp:ListItem>
                <asp:ListItem>N</asp:ListItem>
                <asp:ListItem>P</asp:ListItem>
                <asp:ListItem>Q</asp:ListItem>
                <asp:ListItem>R</asp:ListItem>
                <asp:ListItem>S</asp:ListItem>
                <asp:ListItem>T</asp:ListItem>
                <asp:ListItem>U</asp:ListItem>
                <asp:ListItem>V</asp:ListItem>
                <asp:ListItem>W</asp:ListItem>
                <asp:ListItem>X</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Select Room Type:"></asp:Label>
&nbsp;
            <br />
            <asp:RadioButton ID="singleRadioButton" runat="server" AutoPostBack="True" GroupName="roomType" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Single" />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="sharingRadioButton" runat="server" AutoPostBack="True" GroupName="roomType" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Sharing" />
&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" GroupingText="Ground(G..) &amp; First(1..) Singles" Width="419px">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                </asp:RadioButtonList>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="Panel2" runat="server" GroupingText="Ground(G..) &amp; First(1..) Floor Sharing:" Width="417px">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                </asp:RadioButtonList>
            </asp:Panel>
            <br />
            <br />
            <asp:Button ID="chooseButton" runat="server" Height="31px" Text="Choose Room" Width="124px" OnClick="chooseButton_Click" />
        </div>
    </form>
</body>
</html>
