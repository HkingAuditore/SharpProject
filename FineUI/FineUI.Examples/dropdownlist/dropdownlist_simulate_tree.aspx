<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownlist_simulate_tree.aspx.cs"
    Inherits="FineUI.Examples.data.dropdownlist_simulate_tree" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" LabelWidth="150px" Width="550px" EnableCollapse="true"
            ShowBorder="True" Title="简单表单" ShowHeader="True">
            <Items>
                <f:DropDownList Label="模拟树的下拉列表" AutoPostBack="false" Required="true" EnableSimulateTree="true"
                    ShowRedStar="true" runat="server" ID="ddlBox">
                </f:DropDownList>

                <f:Button ID="Button1" Text="获取选中项" runat="server" OnClick="Button1_Click">
                </f:Button>


            </Items>
        </f:SimpleForm>
        <br />
        <f:Label runat="server" ID="labResult">
        </f:Label>
        <br />
    </form>
</body>
</html>
