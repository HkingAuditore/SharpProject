<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_form.aspx.cs" Inherits="FineUI.Examples.layout.vbox_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Panel1" Title="表单（Layout=VBox）" runat="server" Width="600px" Height="400px"
            LabelAlign="Right" LabelWidth="80px"
            BodyPadding="5" ShowBorder="true" ShowHeader="true" Layout="VBox">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" Label="姓名" ShowRedStar="true" Required="true"></f:TextBox>
                <f:DropDownList ID="DropDownList1" Label="性别" ShowRedStar="true" Required="true" runat="server">
                    <f:ListItem Text="男" Value="男" Selected="true" />
                    <f:ListItem Text="女" Value="女" />
                </f:DropDownList>
                <f:TextArea ID="TextArea1" CssStyle="margin-bottom:0;" Label="个人简介" runat="server" BoxFlex="1"></f:TextArea>
            </Items>
        </f:Form>
        <br />
        <br />
        注：设置[个人简介]的 CssStyle="margin-bottom:0;"，来去除底部外边距。
    </form>
</body>
</html>
