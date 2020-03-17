﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="image.aspx.cs" Inherits="FineUI.Examples.form.image" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        Icon="World"：
        <br />
        <f:Image ID="Image1" runat="server" Icon="World">
        </f:Image>
        <br />
        ImageUrl="../res/icon/world.png"：
        <br />
        <f:Image ID="Image2" runat="server" ImageUrl="../res/icon/world.png">
        </f:Image>
        <br />
        ImageUrl="~/res/images/logo/favicon.gif" ImageCssStyle="border:solid 1px #ccc;padding:5px;"：
        <br />
        <f:Image ID="Image3" runat="server" ImageWidth="32" ImageHeight="32" ImageCssStyle="border:solid 1px #ccc;padding:5px;"
            ImageUrl="~/res/images/logo/favicon.gif">
        </f:Image>
        <br />
        <f:Button runat="server" Text="改变图片的大小" ID="Button1" OnClick="Button1_Click">
        </f:Button>
    </form>
</body>
</html>
