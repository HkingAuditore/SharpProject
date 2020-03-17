﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parent_postback.aspx.cs"
    Inherits="FineUI.Examples.iframe.parent_postback" %>

<!DOCTYPE html>
<html>
<head id="head1" runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/parent_postback2.aspx;~/iframe/parent_postback3.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        页面一：parent_postback.aspx
        <br />
        <f:Label ID="labResult" runat="server">
        </f:Label>
        <br />
        <f:Button ID="Button1" CssClass="marginr" runat="server" Text="页面一中的按钮">
        </f:Button>
        <f:Button ID="Button2" runat="server" EnablePostBack="false" Text="刷新面板一中的IFrame">
        </f:Button>
        <br />
        <br />
        <f:Panel ID="Panel1" runat="server" ShowBorder="true" EnableCollapse="true"
            Width="800px" Height="450px" EnableIFrame="true" IFrameUrl="parent_postback2.aspx"
            ShowHeader="true" Title="面板一">
        </f:Panel>
    </form>
</body>
</html>
