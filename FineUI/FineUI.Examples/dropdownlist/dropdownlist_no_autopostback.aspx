<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_no_autopostback.aspx.cs" Inherits="FineUI.Examples.dropdownlist.dropdownlist_no_autopostback" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" Width="450px" EnableCollapse="true"
            ShowBorder="True" Title="简单下拉列表（不自动回发，定义了回发事件）" ShowHeader="True">
            <Items>
                <f:DropDownList runat="server" ID="DropDownList1" AutoSelectFirstItem="false" AutoPostBack="false" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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
        注：下拉列表不自动回发（AutoPostBack=false），但是定义了SelectedIndexChanged事件，可以尝试进行如下操作：
        <ul>
            <li>
                改变下拉列表的选择项，比如选中[可选项4]；
            </li>
            <li>
                点击按钮[获取此下拉列表的选中项]，此时会触发下拉列表的SelectedIndexChanged事件。
            </li>
        </ul>
        <ul>
            <li>
                点击按钮[选中[可选项6]]；
            </li>
            <li>
                点击按钮[获取此下拉列表的选中项]，此时不会触发下拉列表的SelectedIndexChanged事件。
            </li>
        </ul>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
    </form>
</body>
</html>
