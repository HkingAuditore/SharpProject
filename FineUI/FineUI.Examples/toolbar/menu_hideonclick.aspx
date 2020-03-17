<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_hideonclick.aspx.cs" Inherits="FineUI.Examples.toolbar.menu_hideonclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .my-menutext,
        .my-menutext .x-menu-item-link,
        .my-menutext .x-menu-item-text {
            cursor: default;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ShowBorder="true" BodyPadding="5px" Height="300px" Width="650px" Title="面板" EnableCollapse="true"
            runat="server">
            <Toolbars>
                <f:Toolbar runat="server">
                    <Items>
                        <f:ToolbarText runat="server" Text="内联菜单">
                        </f:ToolbarText>
                        <f:ToolbarSeparator runat="server">
                        </f:ToolbarSeparator>
                        <f:Button EnablePostBack="false" Text="中国科学技术大学" runat="server">
                            <Menu ID="Menu1" runat="server">
                                <f:MenuHyperLink ID="MenuHyperLink1" runat="server" Target="_blank" NavigateUrl="http://scms.ustc.edu.cn/"
                                    Text="化学与材料科学学院">
                                </f:MenuHyperLink>
                                <f:MenuText ID="MenuText1" runat="server" HideOnClick="false" CssClass="my-menutext" Text="管理学院">
                                    <Menu ID="Menu2" runat="server">
                                        <f:MenuHyperLink ID="MenuHyperLink3" runat="server" Target="_blank" NavigateUrl="http://is.ustc.edu.cn/"
                                            Text="工商管理系">
                                        </f:MenuHyperLink>
                                        <f:MenuHyperLink ID="MenuHyperLink4" runat="server" Target="_blank" NavigateUrl="http://stat.ustc.edu.cn/"
                                            Text="统计与金融系">
                                        </f:MenuHyperLink>
                                    </Menu>
                                </f:MenuText>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <br />
        注：为【管理学院】项设置了属性HideOnClick=false，所以点击不会隐藏菜单。
    </form>
</body>
</html>
