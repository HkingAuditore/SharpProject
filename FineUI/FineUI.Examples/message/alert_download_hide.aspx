<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alert_download_hide.aspx.cs"
    Inherits="FineUI.Examples.message.alert_download_hide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" OnCustomEvent="PageManager1_CustomEvent" runat="server" />
        <f:Window ID="Window1" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" Hidden="false"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" BodyPadding="10px">
            <Items>
                <f:Button Text="操作（先弹出提示框，点击确定后先关闭弹出窗体，然后下载文件）" runat="server" ID="btnOperation" OnClick="btnOperation_Click">
                </f:Button>
            </Items>
        </f:Window>
    </form>
</body>
</html>
