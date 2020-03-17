<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form_hide_field.aspx.cs"
    Inherits="FineUI.Examples.form.form_hide_field" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Form Width="600px" LabelWidth="100px" BodyPadding="5px" EnableCollapse="true"
            ID="Form2" runat="server" Title="表单">
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="labTitle" HideMode="Visibility" Label="标题" Text="申请单" runat="server" />
                        <f:Label ID="labLiuShuiHao" Label="流水号" Text="123456789" runat="server" />
                    </Items>
                </f:FormRow>
                <f:FormRow runat="server" ID="FormRow2">
                    <Items>
                        <f:Label ID="labPhone" Label="电话" Text="0551-1234567" runat="server" />
                        <f:Label ID="Label16" runat="server" Label="申请人" Text="admin">
                        </f:Label>
                    </Items>
                </f:FormRow>
                <f:FormRow runat="server" ID="FormRow3" HideMode="Visibility">
                    <Items>
                        <f:Label ID="Label4" Label="编号" Text="200804170006" runat="server" />
                        <f:TextBox ID="TextBox2" Required="true" ShowRedStar="true" Label="电子邮箱" EmptyText="请输入常用电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址！" runat="server">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:DropDownList ID="DropDownList3" Label="审批人" Required="true" EmptyText="请选择审批人" runat="server" ShowRedStar="True" AutoSelectFirstItem="false">
                            <f:ListItem Text="老大甲" Value="0"></f:ListItem>
                            <f:ListItem Text="老大乙" Value="1"></f:ListItem>
                            <f:ListItem Text="老大丙" Value="2"></f:ListItem>
                        </f:DropDownList>
                        <f:NumberBox ID="NumberBox1" Label="申请数量" NoDecimal="true" NoNegative="true" EmptyText="请输入申请数量" MaxValue="1000" Required="true" runat="server"
                            ShowRedStar="True" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea1" runat="server" Label="描述" ShowRedStar="True" Required="True">
                        </f:TextArea>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:Panel ID="Panel2" runat="server" ShowBorder="false"
                            ShowHeader="false">
                            <Items>
                                <f:Button ID="btnSubmitForm2" Text="验证表单并提交" CssClass="marginr" runat="server" OnClick="btnSubmitForm2_Click"
                                    ValidateForms="Form2">
                                </f:Button>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
        <br />
        <f:Button ID="btnShowHideTitle" Text="显示隐藏[标题]" CssClass="marginr" runat="server"
            OnClick="btnShowHideTitle_Click">
        </f:Button>
        <f:Button ID="btnShowHidePhone" Text="显示隐藏[电话]" runat="server"
            OnClick="btnShowHidePhone_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowHideFormRow2" Text="显示隐藏第二行" CssClass="marginr" runat="server"
            OnClick="btnShowHideFormRow2_Click">
        </f:Button>
        <f:Button ID="btnShowHideFormRow3" Text="显示隐藏第三行（隐藏后显示空白行）" CssClass="marginr" runat="server"
            OnClick="btnShowHideFormRow3_Click">
        </f:Button>
        <br />
        <br />
        注：
        <ul>
            <li>
                对比隐藏[标题]和隐藏[电话]的不同之处（[标题]的HideMode=Visibility）
            </li>
            <li>
                对比隐藏第二行和隐藏第三行的不同之处（FormRow3的HideMode=Visibility）
            </li>
        </ul>
    </form>
</body>
</html>
