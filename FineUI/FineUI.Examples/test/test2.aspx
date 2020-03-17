<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="FineUI.Examples.test.test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:DropDownList runat="server" ID="DropDownList1">
            <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
            <f:ListItem Text="可选项2" Value="Value2" />
            <f:ListItem Text="可选项3" Value="Value3" />
        </f:DropDownList>
        <f:Button runat="server" Text="提交" 
            ID="btnSubmit" OnClick="btnSubmit_Click"></f:Button>
        <br />
        <br />
        <br /><br />
        <br />
        <br /><br />
        <br />
        <br /><br />
        <br />
        <br /><br />
        <br />
        <br /><br />
        <br />
        <br />
        var ddl = F("DropDownList1");
        var newdata = [
            ["Data1", "数据1", 1],
            ["Data2", "数据2", 1],
            ["Data3", "数据3", 1]
        ];

        ddl.f_state.F_Items = newdata;
        ddl.store.loadData(newdata);
        ddl.setValue("Data1");
    </form>
</body>
</html>
