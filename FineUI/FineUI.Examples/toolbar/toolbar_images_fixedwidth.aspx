<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_images_fixedwidth.aspx.cs"
    Inherits="FineUI.Examples.toolbar.toolbar_images_fixedwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" Title="面板" Width="650px" Height="250px"
            EnableIFrame="true" IFrameName="main" EnableCollapse="true">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Image ID="Image1" runat="server" Width="16px" Icon="ArrowRight">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button1" Text="按钮一" EnablePostBack="false"
                            OnClientClick="alert('Button1');">
                        </f:LinkButton>
                        <f:Image ID="Image2" runat="server" Width="16px" Icon="World">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button2" Text="按钮二" EnablePostBack="false"
                            OnClientClick="alert('Button2');">
                        </f:LinkButton>
                        <f:Image ID="Image3" runat="server" Width="16px" Icon="Cake">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button3" Text="按钮三" EnablePostBack="false"
                            OnClientClick="alert('Button3');">
                        </f:LinkButton>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <br />
        注：
        <ul>
            <li>由于页面布局时图片尚未加载，所以会造成布局错乱</li>
            <li>可以为 Image 控件设置固定宽度来解决</li>
        </ul>
    </form>
</body>
</html>
