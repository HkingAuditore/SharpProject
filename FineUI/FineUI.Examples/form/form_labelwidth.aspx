<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_labelwidth.aspx.cs" Inherits="FineUI.Examples.form.form_labelwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form Width="650px" BodyPadding="5px" ID="Form1" LabelWidth="120px" LabelAlign="Right" EnableCollapse="true"
            runat="server" Title="表单（LabelWidth=120 LabelAlign=Right）">
            <Rows>
                <f:FormRow ColumnWidths="50% 50%">
                    <Items>
                        <f:Label ID="Label1" runat="server" Label="标签" LabelWidth="150px" LabelAlign="Left" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="50% 50%">
                    <Items>
                        <f:DropDownList ID="DropDownList1" runat="server" Required="true" LabelWidth="150px" LabelAlign="Left"
                             ShowRedStar="true" AutoSelectFirstItem="false" Label="下拉列表（长标签）">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                            Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel1" runat="server" CssStyle="text-align: right;" ShowBorder="false" ShowHeader="false">
                            <Items>
                                <f:Button runat="server" Text="验证此表单并提交" ValidateForms="Form1"
                                    ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        注：表单字段定义的 LabelWidth 和 LabelAlign 属性会覆盖 Form 的同名属性
    </form>
</body>
</html>
