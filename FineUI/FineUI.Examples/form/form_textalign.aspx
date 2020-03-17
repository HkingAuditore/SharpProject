<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_textalign.aspx.cs" Inherits="FineUI.Examples.form.form_textalign" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .text-align-center input {
            text-align: center;
        }
        .text-align-right input {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" Width="550px" LabelWidth="150px" EnableCollapse="true"
            Title="简单表单" runat="server">
            <Items>
                <f:TextBox runat="server" Label="文本输入框" ID="TextBox1" Required="true" Text="文本居左" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="文本输入框（居中）" ID="TextBox2" CssClass="text-align-center" Text="文本居中" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="文本输入框（居右）" ID="TextBox3" CssClass="text-align-right" Text="文本居右" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:Button ID="btnSubmit" runat="server" ValidateForms="SimpleForm1" Text="提交表单" OnClick="btnSubmit_Click">
                </f:Button>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
