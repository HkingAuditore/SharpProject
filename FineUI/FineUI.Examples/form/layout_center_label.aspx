<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_center_label.aspx.cs"
    Inherits="FineUI.Examples.form.layout_center_label" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .formtitle .x-form-display-field {
            text-align: center;
            font-size: 20px;
            line-height: 1.5em;
            margin: 10px 0;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form Width="600px" BodyPadding="5px" ID="Form1" LabelWidth="100px" EnableCollapse="true"
            runat="server" ShowHeader="false" Title="表单">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="Label2" CssClass="formtitle x-panel-header-default" runat="server" Text="这是表单标题">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="True" AutoSelectFirstItem="false">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                            Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
            </Rows>
            <Toolbars>
                <f:Toolbar runat="server" Position="Bottom" ToolbarAlign="Center">
                    <Items>
                        <f:Button runat="server" Text="验证此表单并提交" CssClass="mybutton" ValidateForms="Form1"
                            ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click">
                        </f:Button>
                        <f:Button ID="btnResetForm1" EnablePostBack="false" CssClass="mybutton" Text="重置表单"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Form>
    </form>
    
</body>
</html>
