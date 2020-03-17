<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_checkout.aspx.cs"
    Inherits="FineUI.Examples.form.layout_checkout" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="账单信息" IsModal="true" EnableClose="false" EnableResize="true"
            Width="650px" MinHeight="350px" Layout="Fit">
            <Items>
                <f:Form ID="Form1" Width="650px" LabelAlign="Right" MessageTarget="Qtip"
                    BodyPadding="5px" ShowBorder="false" ShowHeader="false" runat="server" AutoScroll="true">
                    <Items>
                        <f:GroupPanel Layout="Anchor" Title="联系人信息" runat="server">
                            <Items>
                                <f:Panel ID="Panel2" Layout="HBox" BoxConfigAlign="Stretch" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                                    <Items>
                                        <f:Label runat="server" ShowRedStar="true" Label="姓名"></f:Label>
                                        <f:TextBox ID="TextBox2" ShowLabel="false" CssClass="marginr" Required="true" ShowRedStar="true" BoxFlex="2" runat="server">
                                        </f:TextBox>
                                        <f:TextBox ID="TextBox4" ShowLabel="false" Required="true" ShowRedStar="true" BoxFlex="3" runat="server">
                                        </f:TextBox>
                                    </Items>
                                </f:Panel>
                                <f:Panel ID="Panel1" Layout="HBox" BoxConfigAlign="Stretch" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                                    <Items>
                                        <f:TextBox ID="TextBox1" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                                            RegexMessage="请输入有效的邮箱地址！" BoxFlex="1" runat="server">
                                        </f:TextBox>
                                        <f:TextBox ID="TextBox6" Label="电话号码" Width="200px" LabelWidth="80px" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                    </Items>
                                </f:Panel>
                            </Items>
                        </f:GroupPanel>
                        <f:GroupPanel ID="GroupPanel1" Layout="Anchor" Title="联系人地址" runat="server">
                            <Items>
                                <f:TextBox ID="TextBox7" Label="详细地址" Required="true" ShowRedStar="true" runat="server">
                                </f:TextBox>
                                <f:Panel ID="Panel4" Layout="HBox" BoxConfigAlign="Stretch" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                                    <Items>
                                        <f:TextBox ID="TextBox9" Label="省" BoxFlex="1" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                        <f:TextBox ID="TextBox5" Label="市" BoxFlex="1" LabelWidth="50px" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                        <f:TextBox ID="TextBox8" Label="邮政编码" Width="200px" LabelWidth="80px" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                    </Items>
                                </f:Panel>
                            </Items>
                        </f:GroupPanel>
                        <f:GroupPanel ID="GroupPanel2" Layout="Anchor" Title="账单地址" runat="server">
                            <Items>
                                <f:CheckBox runat="server" Checked="true" ID="cbxSameAsContactAddress" AutoPostBack="true" OnCheckedChanged="cbxSameAsContactAddress_CheckedChanged" Text="和联系人地址相同"></f:CheckBox>
                                <f:TextBox ID="tbxBillingAddress" Enabled="false" Label="详细地址" Required="true" ShowRedStar="true" runat="server">
                                </f:TextBox>
                                <f:Panel ID="Panel3" Layout="HBox" BoxConfigAlign="Stretch" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                                    <Items>
                                        <f:TextBox ID="tbxBillingProvince" Enabled="false" Label="省" BoxFlex="1" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                        <f:TextBox ID="tbxBillingCity" Enabled="false" Label="市" BoxFlex="1" LabelWidth="50px" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                        <f:TextBox ID="tbxBillingPostCode" Enabled="false" Label="邮政编码" Width="200px" LabelWidth="80px" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                    </Items>
                                </f:Panel>
                            </Items>
                        </f:GroupPanel>
                        <f:GroupPanel ID="GroupPanel3" Layout="Anchor" Title="付款方式" runat="server">
                            <Items>
                                <f:RadioButtonList ID="RadioButtonList1" ColumnNumber="5" ShowLabel="false" runat="server">
                                    <f:RadioItem Text="银联" Value="yinlian" Selected="true" />
                                    <f:RadioItem Text="VISA" Value="visa" />
                                    <f:RadioItem Text="MasteCard" Value="mastercard" />
                                </f:RadioButtonList>
                                <f:TextBox ID="TextBox3" Label="卡上的名字" Required="true" ShowRedStar="true" runat="server">
                                </f:TextBox>
                                <f:Panel ID="Panel5" Layout="HBox" BoxConfigAlign="Stretch" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                                    <Items>
                                        <f:TextBox ID="TextBox14" Label="卡号" BoxFlex="1" Required="true" ShowRedStar="true" runat="server">
                                        </f:TextBox>
                                        <f:DropDownList Label="过期时间" Width="180px" CssClass="marginr" LabelWidth="80px" Required="true" ShowRedStar="true" runat="server">
                                            <f:ListItem Text="一月" Value="1" />
                                            <f:ListItem Text="二月" Value="2" />
                                            <f:ListItem Text="三月" Value="3" />
                                            <f:ListItem Text="四月" Value="4" />
                                            <f:ListItem Text="五月" Value="5" />
                                            <f:ListItem Text="六月" Value="6" />
                                            <f:ListItem Text="七月" Value="7" />
                                            <f:ListItem Text="八月" Value="8" />
                                            <f:ListItem Text="九月" Value="9" />
                                            <f:ListItem Text="十月" Value="10" />
                                            <f:ListItem Text="十一月" Value="11" />
                                            <f:ListItem Text="十二月" Value="12" />
                                        </f:DropDownList>
                                        <f:NumberBox ID="TextBox16" ShowLabel="false" Text="2014" Width="80px" LabelWidth="80px" Required="true" ShowRedStar="true" runat="server">
                                        </f:NumberBox>
                                    </Items>
                                </f:Panel>
                            </Items>
                        </f:GroupPanel>
                    </Items>
                    <Toolbars>
                        <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Right" Position="Bottom">
                            <Items>
                                <f:Button ID="Button1" Text="提交账单" ValidateForms="Form1" ValidateMessageBox="false" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:Form>
            </Items>
        </f:Window>
        <br />
        <br />
        注：已经设置了Form1的AutoScroll="true"，尝试缩小窗体的高度，使其出现纵向滚动条。
    </form>
</body>
</html>
