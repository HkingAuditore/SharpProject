<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aspnet.aspx.cs" Inherits="FineUI.Examples.aspnet.aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AjaxAspnetControls="aspBox" runat="server" />
        <f:ContentPanel ID="ContentPanel1" runat="server" Width="650px" BodyPadding="5px"
            ShowBorder="true" ShowHeader="true" Title="内容面板">
            <f:TextBox runat="server" Width="300px" ID="extBox">
            </f:TextBox>
            <br />
            <asp:TextBox runat="server" Width="300px" ID="aspBox"></asp:TextBox>
            <br />
            <f:Button ID="Button1" runat="server" CssClass="marginr" Text="1. FineUI 按钮（AJAX）"
                OnClick="Button1_Click">
            </f:Button>
            <f:Button ID="Button2" runat="server" Text="2. FineUI 按钮" EnableAjax="false" OnClick="Button2_Click">
            </f:Button>
            <br />
            <asp:Button ID="Button3" Text="3. ASP.NET 按钮（AJAX）" runat="server" OnClick="Button3_Click"
                UseSubmitBehavior="false" />
            <asp:Button ID="Button4" Text="4. ASP.NET 按钮" runat="server" OnClick="Button4_Click" UseSubmitBehavior="true" />
        </f:ContentPanel>
        注意：
        <ul>
            <li>【3. ASP.NET 按钮（AJAX）】设置了属性UseSubmitBehavior=false，点击此按钮是AJAX回发。</li>
            <li>【4. ASP.NET 按钮】设置了属性UseSubmitBehavior=true，点击此按钮会导致整个页面回发。</li>
            <li>由于【4. ASP.NET 按钮】在客户端会被渲染为input[type=submit]，所以在两个文本输入框内按回车键都会导致整个页面回发。</li>
        </ul>
    </form>
</body>
</html>
