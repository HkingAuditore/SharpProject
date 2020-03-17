<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_autopostback_enableedit_noforceselection.aspx.cs" Inherits="FineUI.Examples.dropdownlist.dropdownlist_autopostback_enableedit_noforceselection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" Width="450px" EnableCollapse="true"
            ShowBorder="True" Title="简单下拉列表（自动回发，可编辑，不强制选择）" ShowHeader="True">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1"
                    AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    EnableEdit="true" ForceSelection="false" >
                    <f:ListItem Text="可选项1" Value="Value1" />
                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                    <f:ListItem Text="可选项4" Value="Value4" />
                    <f:ListItem Text="可选项5" Value="Value5" />
                    <f:ListItem Text="可选项6" Value="Value6" />
                    <f:ListItem Text="可选择项7" Value="Value7" />
                    <f:ListItem Text="可选择项8" Value="Value8" />
                    <f:ListItem Text="普通型1 < L > 1.5" Value="普通型1 < L > 1.5" />
                </f:DropDownList>

                <f:Button ID="btnSelectItem6" Text="选中[可选项6]" runat="server" OnClick="btnSelectItem6_Click"
                    CssClass="marginr">
                </f:Button>
                <f:Button ID="btnGetSelection" Text="获取此下拉列表的选中项" runat="server" OnClick="btnGetSelection_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
        <br />
        注：本示例有BUG，用户输入值并且下拉列表失去焦点时不能自动回发。
    </form>
</body>
</html>
