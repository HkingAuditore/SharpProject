<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_columnwidths.aspx.cs" Inherits="FineUI.Examples.form.form_columnwidths" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .speciallabel .x-form-display-field {
            color: red;
        }
    </style>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form Width="600px" LabelWidth="80px" BodyPadding="5px" EnableCollapse="true" LabelAlign="Left"
            ID="Form2" runat="server" Title="表单">
            <Rows>
                <f:FormRow ColumnWidths="20px 50% 50%">
                    <Items>
                        <f:Label runat="server" CssClass="speciallabel" Text="1."></f:Label>
                        <f:Label ID="Label3" Label="电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="20px 50% 50%">
                    <Items>
                        <f:Label ID="Label1" runat="server" CssClass="speciallabel" Text="2."></f:Label>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址！" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="20px 100%">
                    <Items>
                        <f:Label ID="Label2" runat="server" CssClass="speciallabel" Text="3."></f:Label>
                        <f:DropDownList ID="DropDownList3" Label="审批人" runat="server" ForceSelection="false" Required="true" ShowRedStar="True">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="20px 100%">
                    <Items>
                        <f:Label ID="Label5" runat="server" CssClass="speciallabel" Text="4."></f:Label>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" MaxValue="1000" Required="true" runat="server"
                            ShowRedStar="True" />
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="20px 100%">
                    <Items>
                        <f:Label ID="Label6" runat="server" CssClass="speciallabel" Text="5."></f:Label>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="True" Required="True">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false"
                            ShowHeader="false">
                            <Items>
                                <f:Button ID="btnSubmitForm2" Text="提交表单" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
                                    ValidateForms="Form2">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <br />
        注：假设行的总宽度是 100px，行的属性 ColumnWidths="20px 50% 50%"，则：
        <ul>
            <li>第一个字段宽度：20px</li>
            <li>第二个字段宽度：40px</li>
            <li>第三个字段宽度：40px</li>
        </ul>
    </form>
</body>
</html>
