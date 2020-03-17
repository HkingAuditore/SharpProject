<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ckeditor_setvalue.aspx.cs" ValidateRequest="false"
    Inherits="FineUI.Examples.aspnet.ckeditor_setvalue" %>

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
    <script type="text/javascript" src="../res/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">

        var containerClientID = '<%= ContentPanel1.ClientID %>';
        var hfEditorInitValueClientID = '<%= hfEditorInitValue.ClientID %>';

        F.ready(function () {

            // http://docs.ckeditor.com/#!/api/CKEDITOR.config
            CKEDITOR.replace('Editor1', {
                resize_enabled: false,
                height: 200,
                on: {
                    instanceReady: function () {
                        // 设置初始值
                        var editorInitValue = F('hfEditorInitValue').getValue();
                        if (editorInitValue) {
                            this.setData(editorInitValue);
                        }

                        F(containerClientID).updateLayout();
                    }
                }
            });

        });


        // FineUI Ajax提交之前，将编辑器的值同步到表单字段中(textarea)
        F.beforeAjax(function () {
            $('#Editor1').val(CKEDITOR.instances['Editor1'].getData());
        });


        // 更新编辑器内容
        function updateEditor(content) {
            var editor = CKEDITOR.instances['Editor1'];
            editor.setData(content);
        }
    </script>
</body>
</html>
