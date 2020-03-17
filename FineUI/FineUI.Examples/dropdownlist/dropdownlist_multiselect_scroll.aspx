<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_multiselect_scroll.aspx.cs" Inherits="FineUI.Examples.dropdownlist.dropdownlist_multiselect_scroll" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" Width="450px" EnableCollapse="true"
            ShowBorder="True" Title="下拉列表（多选）" ShowHeader="True">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" EnableMultiSelect="true">
                    <f:ListItem Text="可选项1" Value="Value1" Selected="true" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" Selected="true" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="可选择项8" Value="Value9" />
                    <f:ListItem Text="可选择项10" Value="Value10" />
                    <f:ListItem Text="可选择项11" Value="Value11" />
                    <f:ListItem Text="可选择项12" Value="Value12" />
                    <f:ListItem Text="可选择项13" Value="Value13" />
                    <f:ListItem Text="可选择项14" Value="Value14" />
                    <f:ListItem Text="可选择项15" Value="Value15" />
                    <f:ListItem Text="可选择项16" Value="Value16" />
                    <f:ListItem Text="可选择项17" Value="Value17" />
                    <f:ListItem Text="可选择项18" Value="Value18" />
                    <f:ListItem Text="可选择项19" Value="Value19" />
                    <f:ListItem Text="可选择项20" Value="Value20" />
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>


            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" EncodeText="false" ID="labResult">
        </f:Label>
    </form>

</body>
</html>
