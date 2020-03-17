<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculatorWeb.aspx.cs" Inherits="FineUI.Examples.Lab.Webs.CalculatorWeb" %>

<!DOCTYPE html>

<%-- <link href="~/Framework/bootstrap.css" rel="stylesheet"/> --%>
<%-- <link href="~/Framework/bootstrap-theme.css" rel="stylesheet"/> --%>
<%-- <script src="~/Framework/Content/Scripts/bootstrap.min.js"></script> --%>
<%-- <script src="~/Framework/jQuery.1.10.2/Content/Scripts/jquery-1.10.2.js"></script> --%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<form id="form1" runat="server">
<f:PageManager ID="PageManager1" runat="server" />
<f:Panel ID="Panel1" Title="方程求解" runat="server" Layout="Fit" Height="200px"  EnableCollapse="true"
         BodyPadding="5px" Width="650px" ShowBorder="True"
         ShowHeader="True">
    <Items>
        <f:Form ID="Form2" runat="server" ShowBorder="True" BodyPadding="5px" ShowHeader="false" Title="表单">
            <Rows>
                <f:FormRow Width="200px">
                    <Items>
                        <f:TextBox ID="num0" Label="二次项系数" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow Width="200px">
                    <Items>
                        <f:TextBox ID="num1" Label="一次项系数" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow Width="200px">
                    <Items>
                        <f:TextBox ID="num2" Label="常数" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow Width="200px" >
                    <Items>
                        <f:Button ID="Button1" Text="求解方程" runat="server" OnClick="Button1_Click"/>
                        <f:Button ID="Button2" Text="清空输入" runat="server" OnClick="Button2_Click"/>
                    </Items>
                </f:FormRow>
                <f:FormRow Width="800px">
                    <Items>
                        <f:Label ID="Result" ShowLabel="true" Label="结果：" Text=" " runat="server">
                        </f:Label>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </Items>
</f:Panel>
</form>
</body>
</html>