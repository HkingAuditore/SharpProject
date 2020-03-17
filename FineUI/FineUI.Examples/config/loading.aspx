<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loading.aspx.cs" Inherits="FineUI.Examples.config.loading" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
         ul.loading {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

            ul.loading li {
                display: inline-block;
                margin: 0 10px 10px 0;
                text-align: center;
                border: solid 1px #ccc;
                padding: 10px 5px;
                width: 150px;
            }

                ul.loading li .title {
                    margin-top: 10px;
                }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server"></f:PageManager>
        <br />
        <asp:Literal EnableViewState="false" runat="server" ID="litIcons"></asp:Literal>
        <br />
        <br />
        注：图片来自 http://loadinfo.net/ （Generated gifs are free）。
    </form>
</body>
</html>
