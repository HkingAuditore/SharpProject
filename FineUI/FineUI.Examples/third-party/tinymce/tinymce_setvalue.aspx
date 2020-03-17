<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tinymce_setvalue.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Examples.aspnet.tinymce_setvalue" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:ContentPanel ID="ContentPanel1" runat="server" BodyPadding="5px" Width="850px" EnableCollapse="true"
            ShowBorder="true" ShowHeader="true" Title="内容面板">
            <textarea id="Editor1" name="Editor1" style="width: 100%;">
            </textarea>
        </f:ContentPanel>
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="设置编辑器的值" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="获取编辑器的值" OnClick="Button1_Click">
        </f:Button>
        <f:HiddenField runat="server" ID="hfEditorInitValue"></f:HiddenField>
    </form>
    <script type="text/javascript" src="../../res/js/jquery.min.js"></script>
    <script type="text/javascript" src="../res/tinymce/tinymce.min.js"></script>
    <script type="text/javascript">

        var containerClientID = '<%= ContentPanel1.ClientID %>';
        var hfEditorInitValueClientID = '<%= hfEditorInitValue.ClientID %>';

        F.ready(function () {

            tinymce.init({
                selector: '#Editor1',
                resize: false,
                width: '100%',
                height: 200,
                setup: function (editor) {
                    editor.on('load', function (e) {
                        // 设置初始值
                        var editorInitValue = F('hfEditorInitValue').getValue();
                        if (editorInitValue) {
                            this.setContent(editorInitValue);
                        }

                        F(containerClientID).updateLayout();
                    });
                }
            });

        });


        // FineUI Ajax提交之前，将编辑器的值同步到表单字段中(textarea)
        F.beforeAjax(function () {
            tinymce.editors['Editor1'].save();
        });


        // 更新编辑器内容
        function updateEditor(content) {
            var editor = tinymce.editors['Editor1'];
            editor.setContent(content);
        }
    </script>
</body>
</html>
