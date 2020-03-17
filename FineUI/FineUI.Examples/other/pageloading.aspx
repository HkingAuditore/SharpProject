<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pageloading.aspx.cs" Inherits="FineUI.Examples.other.pageloading" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" PageLoadingImageUrl="~/res/images/loading/loading_50.gif" runat="server" />
        这是页面内容
        <br />
    </form>
</body>
</html>
