<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_disabled.aspx.cs" Inherits="FineUI.Examples.window.panel_disabled" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" Title="面板" Width="650px" Enabled="false"
            BodyPadding="10px" EnableCollapse="True">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" Position="Bottom" runat="server">
                    <Items>
                        <f:ToolbarText Text="工具条文本一" ID="ToolbarText1" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText Text="工具条文本二" ID="ToolbarText2" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="btnToolbarButton" Text="工具条按钮" runat="server" EnablePostBack="false">
                        </f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                        </f:ToolbarFill>
                        <f:ToolbarText Text="工具条文本四" ID="ToolbarText4" runat="server">
                        </f:ToolbarText>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:ContentPanel ID="ContentPanel1" Title="内容面板" ShowBorder="true" Height="200px"
                    BodyPadding="10px" EnableCollapse="true" ShowHeader="true"
                    runat="server">
                    可以在此放置Asp.Net控件或者<a href="http://www.w3schools.com/html/" target="_blank">HTML</a>标签。
                </f:ContentPanel>
            </Items>
        </f:Panel>
        <br />
        <f:Button ID="Button2" CssClass="marginr" Text="启用/禁用面板" runat="server" OnClick="Button2_Click">
        </f:Button>

    </form>
</body>
</html>
