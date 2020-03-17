<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_panel_column.aspx.cs"
    Inherits="FineUI.Examples.form.layout_panel_column" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form ID="Form1" MessageTarget="Qtip" Width="600px" BodyPadding="5px" Title="表单" runat="server">
            <items>
                <f:Panel ID="Panel2" ShowHeader="false" CssClass="formitem" ShowBorder="false"
                    Layout="Column" runat="server">
                    <Items>
                        <f:Label ID="Label2" Width="100px" runat="server" CssClass="marginr" ShowLabel="false"
                            Text="用户名：">
                        </f:Label>
                        <f:TextBox ID="TextBox2" ShowLabel="false" Label="用户名" Required="true" Width="150px" CssClass="marginr" runat="server">
                        </f:TextBox>
                        <f:Button ID="Button3" Text="按钮一" CssClass="marginr" runat="server">
                        </f:Button>
                        <f:Button ID="Button4" Text="按钮二" runat="server">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel1" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="formitem"
                    runat="server">
                    <Items>
                        <f:Label ID="Label1" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="作息起止时间：">
                        </f:Label>
                        <f:DatePicker ID="DatePicker1" ShowLabel="false" Label="作息开始时间" Required="true" CssClass="marginr" Width="150px" runat="server">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker2" ShowLabel="false" Label="作息结束时间" Required="true" CompareControl="DatePicker1" CompareOperator="GreaterThan"
                            CompareMessage="结束日期应该大于开始日期！" Width="150px" runat="server">
                        </f:DatePicker>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel3" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="formitem"
                    runat="server">
                    <Items>
                        <f:Label ID="Label3" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="上班起止时间：">
                        </f:Label>
                        <f:DatePicker ID="DatePicker3" ShowLabel="false" Label="上班开始时间" Required="true" CssClass="marginr" ColumnWidth="50%" runat="server">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker4" ShowLabel="false" Label="上班结束时间" Required="true" CompareControl="DatePicker3" CompareOperator="GreaterThan"
                            CompareMessage="结束日期应该大于开始日期！" ColumnWidth="50%" runat="server">
                        </f:DatePicker>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel4" ShowHeader="false" ShowBorder="false" Layout="Column" CssClass="formitem"
                    runat="server">
                    <Items>
                        <f:Label ID="Label4" runat="server" Width="100px" CssClass="marginr" ShowLabel="false"
                            Text="工作时间：">
                        </f:Label>
                        <f:TextBox Width="40px" ShowLabel="false" Label="工作时间（小时）" Required="true" runat="server">
                        </f:TextBox>
                        <f:Label runat="server" Text="&nbsp;小时&nbsp;">
                        </f:Label>
                        <f:TextBox Width="40px" ShowLabel="false" Label="工作时间（分钟）" Required="true" ID="TextBox1" runat="server">
                        </f:TextBox>
                        <f:Label ID="Label5" runat="server" Text="&nbsp;分钟">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Button ID="Button1" Text="提交表单" ValidateForms="Form1" ValidateMessageBox="true" runat="server">
                </f:Button>
            </items>
        </f:Form>
        <br />
        注意：本页面中表单验证失败的错误提示类型是Qtip，而不是默认的Side。
    </form>
</body>
</html>
