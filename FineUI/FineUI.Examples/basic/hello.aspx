﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hello.aspx.cs" Inherits="FineUI.Examples.basic.hello" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button Text="点击弹出对话框" runat="server" ID="btnHello" OnClick="btnHello_Click">
        </f:Button>
        <br />
        <br />
        <f:Button Text="在顶层窗口弹出对话框" runat="server" ID="btnHello2" OnClick="btnHello2_Click">
        </f:Button>
    </form>
</body>
</html>
