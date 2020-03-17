<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="umeditor.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Examples.aspnet.umeditor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../res/umeditor/themes/default/css/umeditor.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ContentPanel ID="ContentPanel1" runat="server" BodyPadding="5px" Width="900px" EnableCollapse="true"
            ShowBorder="true" ShowHeader="true" Title="内容面板">
            <script type="text/plain" name="Editor1" id="Editor1">
<p>
FineUI（开源版）<br>
基于 ExtJS 的开源 ASP.NET 控件库。<br>
<br>
FineUI的使命<br>
创建 No JavaScript，No CSS，No UpdatePanel，No ViewState，No WebServices 的网站应用程序。<br>
<br>
支持的浏览器<br>
Chrome、Firefox、Safari、IE 8.0+<br>
<br>
授权协议<br>
Apache License 2.0 (Apache)<br>
<br>
相关链接<br>
论坛：http://fineui.com/bbs/<br>
示例：http://fineui.com/demo/<br>
文档：http://fineui.com/doc/<br>
下载：http://fineui.codeplex.com/
</p>
            </script>
        </f:ContentPanel>
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="设置编辑器的值" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="获取编辑器的值" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        注：本示例不支持文件上传，请根据UEditor官网文档自行配置。
    </form>
    <script type="text/javascript">
        window.UMEDITOR_HOME_URL = '<%= ResolveUrl("~/third-party/res/umeditor/") %>';
    </script>
    <script type="text/javascript" src="../../res/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" src="../res/umeditor/umeditor.min.js"></script>
    <script type="text/javascript">

        var containerClientID = '<%= ContentPanel1.ClientID %>';

        var editor, editorFrameHeight = 200;
        F.ready(function () {
            // 初始化
            editor = UM.getEditor("Editor1", {
                initialFrameWidth: '100%',
                initialFrameHeight: editorFrameHeight,
                autoHeightEnabled: false,
                autoFloatEnabled: false,
                focus: true,
                onready: function () {
                    // 重新布局外部容器
                    F(containerClientID).updateLayout();
                }
            });


            editor.addListener('fullscreenchanged', function (type, isfullscreen) {
                if (!isfullscreen) {

                    // 重置编辑器内容区域高度，这个高度在切换全屏时会改变，应该是 UMEditor 自身的BUG
                    $('#Editor1').height(editorFrameHeight);

                    // 重新布局外部容器
                    F(containerClientID).updateLayout();
                }
            });

        });

        // 更新编辑器内容
        function updateEditor(content) {
            if (editor && editor.isReady) {
                editor.setContent(content);
            }
        }
    </script>
</body>
</html>
