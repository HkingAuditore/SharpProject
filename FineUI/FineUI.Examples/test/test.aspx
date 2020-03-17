<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="FineUI.Examples.test.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <asp:DropDownList runat="server" ID="DropDownList1" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Text="可选项1" Value="Value1" Selected="true" />
            <asp:ListItem Text="可选项2（不可选择）" Value="Value2" />
            <asp:ListItem Text="可选项3（不可选择）" Value="Value3" />
            <asp:ListItem Text="可选项4" Value="Value4" />
            <asp:ListItem Text="可选项5" Value="Value5" />
            <asp:ListItem Text="可选项6" Value="Value6" />
            <asp:ListItem Text="可选择项7" Value="Value7" />
            <asp:ListItem Text="可选择项8" Value="Value8" />
            <asp:ListItem Text="普通型1 < L > 1.5" Value="普通型1 < L > 1.5" />
            <asp:ListItem Text="一个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的可选择项" Value="Value11" />
        </asp:DropDownList>
    </form>
</body>
</html>
