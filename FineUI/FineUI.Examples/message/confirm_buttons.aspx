<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm_buttons.aspx.cs"
    Inherits="FineUI.Examples.message.confirm_buttons" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="操作一（自定义对话框按钮文本）" runat="server" ID="btnOperation1" EnablePostBack="false">
            <Listeners>
                <f:Listener Event="click" Handler="onOperation1Click" />
            </Listeners>
        </f:Button>
    </form>

    <script>

        function onOperation1Click() {

            Ext.MessageBox.show({
                msg: '您即将直接退出，如果您修改了相关信息，请先保存！',
                title: '确认退出',
                buttons: Ext.Msg.YESNO,
                buttonText:
                {
                    yes: '直接退出',
                    no: '不退出'
                },
                fn: function (btnId) {
                    if (btnId === 'yes') {
                        __doPostBack('', 'ConfirmOK');
                    } else {
                        __doPostBack('', 'ConfirmCancel');
                    }
                }
            });
        }

    </script>
</body>
</html>
