<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addtab.aspx.cs" Inherits="FineUI.Examples.other.addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="Button1" runat="server" EnablePostBack="false" OnClientClick="openHelloFineUI();"
            Text="向父页面添加选项卡">
        </f:Button>
        <br />
        <br />
       
        <f:Button ID="Button4" runat="server" EnablePostBack="false" OnClientClick="openHelloFineUI2();"
            Text="向父页面添加选项卡（与上个按钮添加的选项卡为同一个）">
        </f:Button>
         <br />
        <br />
        <f:Button ID="Button2" runat="server" EnablePostBack="false" OnClientClick="closeActiveTab();"
            Text="关闭当前选项卡">
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="关闭当前选项卡（服务器端注册脚本）">
        </f:Button>
    </form>
    <script type="text/javascript">

        var basePath = '<%= ResolveUrl("~/") %>';

        function openHelloFineUI() {
            parent.addExampleTab.apply(null, ['hello_fineui_tab', basePath + 'basic/hello.aspx', '你好 FineUI', basePath + 'res/images/filetype/vs_aspx.png', true]);
        }

        function openHelloFineUI2() {
            parent.addExampleTab.apply(null, ['hello_fineui_tab', basePath + 'basic/login.aspx', '登陆页面', basePath + 'res/images/filetype/vs_html.png', true]);
        }

        function closeActiveTab() {
            parent.removeActiveTab();
        }
    </script>
</body>
</html>
