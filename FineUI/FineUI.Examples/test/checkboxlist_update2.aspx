<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkboxlist_update2.aspx.cs"
    Inherits="FineUI.Examples.form.checkboxlist_update2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" Width="700px" runat="server" LabelWidth="120px" EnableCollapse="true"
            BodyPadding="5px" ShowBorder="True" ShowHeader="True"
            Title="简单表单">
            <Items>
               
                <f:CheckBoxList ID="CheckBoxList2" Label="列表二（竖排）" ColumnNumber="3" ColumnVertical="true"
                    runat="server">
                </f:CheckBoxList>
                <f:Button ID="btnUpdateList2" CssClass="marginr" Text="更新列表二" OnClick="btnUpdateList2_Click"
                    runat="server">
                </f:Button>
                <f:Button ID="btnCheckedItemsList2" Text="获取列表二的选中项" OnClick="btnCheckedItemsList2_Click"
                    runat="server">
                </f:Button>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
