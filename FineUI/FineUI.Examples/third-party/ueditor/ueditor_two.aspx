<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ueditor_two.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Examples.aspnet.ueditor_two" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../res/ueditor/themes/default/css/ueditor.min.css" />
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" BodyPadding="5px" LabelWidth="80px" Width="900px" EnableCollapse="true"
            Title="添加文章" runat="server">
            <Items>
                <f:TextBox ID="tbxTitle" Label="文章标题" Required="true" runat="server">
                </f:TextBox>
                <f:Panel ID="Panel2" Layout="Column" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                    <Items>
                        <f:Label ID="Label2" Width="80px" runat="server" CssClass="marginr" ShowLabel="false"
                            Text="文章正文：">
                        </f:Label>
                        <f:ContentPanel ID="ContentPanel2" ColumnWidth="100%" runat="server" ShowBorder="false" ShowHeader="false">
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
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel1" Layout="Column" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                    <Items>
                        <f:Label ID="Label1" Width="80px" runat="server" CssClass="marginr" ShowLabel="false"
                            Text="文章摘要：">
                        </f:Label>
                        <f:ContentPanel ID="ContentPanel3" ColumnWidth="100%" runat="server" ShowBorder="false" ShowHeader="false">
                            <script type="text/plain" name="Editor2" id="Editor2"></script>
                        </f:ContentPanel>
                    </Items>
                </f:Panel>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" runat="server" ValidateForms="Form1"
                            Text="获取文章内容" OnClick="Button1_Click">
                        </f:Button>
                        <f:Button ID="Button2" runat="server" Text="更新文章摘要" OnClick="Button2_Click">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>
        <f:Label runat="server" ID="labResult" EncodeText="false">
        </f:Label>
        <br />
    </form>
    
    <script type="text/javascript">
        window.UEDITOR_HOME_URL = '<%= ResolveUrl("~/third-party/res/ueditor/") %>';
    </script>
    <script type="text/javascript" src="../../res/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../res/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">

        var containerClientID = '<%= Form1.ClientID %>';

        var editor1, editor2;
        F.ready(function () {
            editor1 = UE.getEditor('Editor1', {
                initialFrameWidth: '100%',
                initialFrameHeight: 150,
                autoHeightEnabled: false,
                autoFloatEnabled: false,
                onready: function () {
                    // 重新布局外部容器
                    doLayout();
                }
            });


            editor2 = UE.getEditor('Editor2', {
                initialFrameWidth: '100%',
                initialFrameHeight: 80,
                initialContent: '',
                autoHeightEnabled: false,
                autoFloatEnabled: false,
                toolbars: [['fullscreen', 'source', '|', 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript',
                'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain']],
                onready: function () {
                    // 重新布局外部容器
                    doLayout();
                }
            });

        });

        function doLayout() {
            if ((editor1 && editor1.isReady) && (editor2 && editor2.isReady)) {
                // 重新布局外部容器
                F(containerClientID).doLayout();
            }
        }

        // 更新编辑器内容
        function updateEditor1(content) {
            if (editor1 && editor1.isReady) {
                editor1.setContent(content);
            }
        }

        function updateEditor2(content) {
            if (editor2 && editor2.isReady) {
                editor2.setContent(content);
            }
        }
    </script>
</body>
</html>
