<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_multiline_buttons.aspx.cs"
    Inherits="FineUI.Examples.form.layout_multiline_buttons" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm Width="600px" BodyPadding="5px" ID="Form1" LabelWidth="100px" EnableCollapse="true"
            runat="server" Title="表单">
            <Items>
                <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                </f:Label>
                <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                </f:CheckBox>
                <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="True" AutoSelectFirstItem="false">
                    <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                    <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                </f:DropDownList>
                <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                    Text="">
                </f:TextBox>
                <f:Panel ID="Panel1" runat="server" ShowBorder="false" CssStyle="margin-bottom:5px;" ShowHeader="false">
                    <Items>
                        <f:Button runat="server" CssClass="marginr" Text="按钮一" EnablePostBack="false">
                        </f:Button>
                        <f:Button ID="Button3" runat="server" CssClass="marginr" Text="按钮二" EnablePostBack="false">
                        </f:Button>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" runat="server" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:Button runat="server" Text="验证此表单并提交" CssClass="marginr" ValidateForms="Form1"
                            ID="Button1" OnClick="btnSubmitForm1_Click">
                        </f:Button>
                        <f:Button ID="btnReset" EnablePostBack="false" CssClass="marginr" Text="重置表单"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Panel>
            </Items>
        </f:SimpleForm>
        <br />
        <br />
        注：第一行按钮所在的面板设置了样式：CssStyle="margin-bottom:5px;"。
    </form>
</body>
</html>
