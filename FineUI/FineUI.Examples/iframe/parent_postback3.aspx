﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parent_postback3.aspx.cs"
    Inherits="FineUI.Examples.iframe.parent_postback3" %>

<!DOCTYPE html>
<html>
<head id="head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        页面三：parent_postback3.aspx
    <br />
        <f:Button ID="Button1" runat="server" Text="关闭本窗体，回发父页面和父页面的父页面" OnClick="Button1_Click">
        </f:Button>
    </form>
</body>
</html>
