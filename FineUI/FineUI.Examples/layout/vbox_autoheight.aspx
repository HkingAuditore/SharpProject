<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_autoheight.aspx.cs" Inherits="FineUI.Examples.layout.vbox_autoheight" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" runat="server" Width="850px" ShowBorder="True" EnableCollapse="true"
            Layout="VBox" ShowHeader="True" Title="面板（Layout=VBox BodyPadding=5 BoxConfigChildMargin=0 0 5 0）"
            BoxConfigChildMargin="0 0 5 0" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Height="100px" runat="server"
                    BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Height=100">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1" MinHeight="200px" Margin="0"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=1 Margin=0 MinHeight=200">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
