<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jysmyn_Verries Room Selection.aspx.cs" Inherits="Res_Admin_Management_System.Jysmyn_Verries_Room_Selection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 979px;
            height: 433px;
        }
    </style>   
</head>
<body>
    <form id="form2" runat="server">
        <div class="auto-style1">
            <br />
            <br />
            <br />
            <br />
            <asp:Panel ID="verriesPanel" runat="server" GroupingText="Vergelegen Rooms:" Height="177px" Width="320px">
                <asp:Label ID="verriesBlocks" runat="server" Text="Select Block: "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="A">A</asp:ListItem>
                    <asp:ListItem Value="B">B</asp:ListItem>
                    <asp:ListItem Value="C">C</asp:ListItem>
                    <asp:ListItem Value="D">D</asp:ListItem>
                    <asp:ListItem Value="E">E</asp:ListItem>
                    <asp:ListItem Value="F">F</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <asp:Label ID="verriesRooms" runat="server" Text="Select Room: "></asp:Label>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:Button ID="chooseButton" runat="server" OnClick="chooseButton_Click" Text="choose room" />
                &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server">
                </asp:RadioButtonList>
            </asp:Panel>
            <br />
            <asp:Panel ID="jasmynPanel" runat="server" GroupingText="Jasmyn Rooms:" Height="182px" Width="320px">
                &nbsp;<asp:Label ID="jysmynBlocks" runat="server" Text="Select Block:"></asp:Label>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem Value="G">G</asp:ListItem>
                    <asp:ListItem Value="H">H</asp:ListItem>
                    <asp:ListItem Value="I">I</asp:ListItem>
                    <asp:ListItem Value="J">J</asp:ListItem>
                    <asp:ListItem Value="L">L</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="N">N</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="jysmynRoms" runat="server" Text="Select Room:"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                </asp:RadioButtonList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="choosejysmynButton" runat="server" OnClick="choosejysmynButton_Click" Text="choose room" />
                <br />
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;
                </asp:Panel>
            <br />
            <br />
&nbsp;&nbsp;
        </div>
    </form>
</body>
</html>