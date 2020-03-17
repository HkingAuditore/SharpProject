<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_datatable.aspx.cs"
    Inherits="FineUI.Examples.tree.databind.tree_datatable" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" Width="650px" ShowHeader="true" EnableCollapse="true"
            Title="树控件" runat="server">
        </f:Tree>
    </form>
</body>
</html>
