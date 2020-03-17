<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_scrollbar.aspx.cs" Inherits="FineUI.Examples.layout.vbox_scrollbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel5" runat="server" />
        <f:Panel ID="Panel5" runat="server" ShowBorder="True" EnableCollapse="true"
            Layout="VBox" AutoScroll="true"
            ShowHeader="True" Title="面板（Layout=VBox BodyPadding=5 BoxConfigChildMargin=0 0 5 0 AutoScroll=true），高度变小时可能出现纵向滚动条"
            BoxConfigChildMargin="0 0 5 0" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" Height="300px" runat="server"
                    BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="Height=300">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1" MinHeight="300px" Margin="0"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="BoxFlex=1 Margin=0 MinHeight=300">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
</body>
</html>
