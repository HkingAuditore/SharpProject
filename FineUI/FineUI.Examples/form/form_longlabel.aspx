<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_longlabel.aspx.cs" Inherits="FineUI.Examples.form.form_longlabel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" Width="550px" EnableCollapse="true"
            Title="简单表单" runat="server">
            <Items>
                <f:TextBox runat="server" Label="文本输入框（很长很长很长的标签）" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TriggerBox ID="tbxMyBox1" ShowLabel="true" ShowRedStar="True" Required="true" Label="触发器输入框（很长很长很长的标签）" Readonly="false" TriggerIcon="Search" runat="server">
                </f:TriggerBox>
                <f:NumberBox Label="数字输入框（很长很长很长的标签）" ID="NumberBox5" runat="server" ShowRedStar="True" Required="true" />
                <f:DatePicker runat="server" DateFormatString="yyyy-MM-dd" Label="日期选择器（很长很长很长的标签）"
                    ID="DatePicker1" ShowRedStar="True" Required="true">
                </f:DatePicker>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
