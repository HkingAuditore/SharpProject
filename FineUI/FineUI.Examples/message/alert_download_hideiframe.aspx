<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download_hideiframe.aspx.cs"
    Inherits="FineUI.Examples.message.alert_download_hideiframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/message/alert_download_hideiframe_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体（EnableIFrame=true）" Hidden="false"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" BodyPadding="10px" EnableIFrame="true" IFrameUrl="~/message/alert_download_hideiframe_window.aspx">
        </f:Window>
    </form>
    <script>

        function showConfirm() {
            F.confirm({
                message: '操作成功！点击确定按钮开始下载文件，点取消按钮弹出对话框',
                ok: function () {
                    // 第一个参数 false 用来指定当前不是AJAX请求
                    __doPostBack(false, '', 'Confirm_OK');

                    //// 下面是老的方法（可以使用，但是不推荐）
                    //F.controlEnableAjax = false;
                    //__doPostBack('', 'Confirm_OK');
                },
                cancel: function () {
                    __doPostBack('', 'Confirm_Cancel');
                }
            });
        }


    </script>
</body>
</html>
