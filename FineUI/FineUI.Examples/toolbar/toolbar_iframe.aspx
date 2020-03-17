<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_iframe.aspx.cs"
    Inherits="FineUI.Examples.toolbar.toolbar_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" Title="面板" Width="600px" Height="450px"
            EnableIFrame="true" IFrameName="main" IFrameUrl="about:blank"
            EnableCollapse="true">
            <Toolbars>
                <f:Toolbar runat="server" Position="Top">
                    <Items>
                        <f:Button runat="server" ID="Button1" Text="打开页面一" EnablePostBack="false"
                            OnClientClick="updateIFrameUrl2('../basic/hello.aspx');">
                        </f:Button>
                        <f:Button runat="server" ID="Button2" Text="打开页面二" EnablePostBack="false"
                            OnClientClick="updateIFrameUrl2('../basic/hello_aspnet.aspx');">
                        </f:Button>
                        <f:Button runat="server" ID="Button3" Text="打开页面三（服务器端）" OnClick="Button3_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
    </form>
    <script src="../res/js/jquery.min.js"></script>
    <script>
        var panel1ClientID = '<%= Panel1.ClientID %>';

        function updateIFrameUrl(url) {
            $(F(panel1ClientID).el.dom).find('iframe').attr('src', url);
        }

        // updateIFrameUrl 和 updateIFrameUrl2 效果一样
        function updateIFrameUrl2(url) {
            window.open(url, 'main');
        }

    </script>
</body>
</html>
