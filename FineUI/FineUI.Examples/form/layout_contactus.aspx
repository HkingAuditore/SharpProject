<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout_contactus.aspx.cs"
    Inherits="FineUI.Examples.form.layout_contactus" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="_form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" Title="联系我们" IsModal="true" EnableClose="false" EnableResize="true"
            Width="550px" Height="400px" MinHeight="350px" Layout="Fit">
            <Items>
                <f:Form ID="Form1" Layout="VBox" BoxConfigAlign="Stretch" LabelAlign="Top" BodyPadding="5px" ShowBorder="false" ShowHeader="false" runat="server">
                    <Items>
                        <f:Panel ID="Panel2" Layout="Column" CssClass="formitem" ShowHeader="false" ShowBorder="false" runat="server">
                            <Items>
                                <f:TextBox ID="TextBox2" Label="姓" Margin="0 5 0 0" Required="true" ShowRedStar="true" ColumnWidth="50%" runat="server">
                                </f:TextBox>
                                <f:TextBox ID="TextBox4" Label="名" Required="true" ShowRedStar="true" ColumnWidth="50%" runat="server">
                                </f:TextBox>
                            </Items>
                        </f:Panel>
                        <f:TextBox ID="TextBox1" Required="true" ShowRedStar="true" Label="电子邮箱" RegexPattern="EMAIL"
                            RegexMessage="请输入有效的邮箱地址！" runat="server">
                        </f:TextBox>
                        <f:TextBox ID="TextBox3" Required="true" ShowRedStar="true" Label="主题" runat="server">
                        </f:TextBox>
                        <f:TextArea ID="TextArea1" BoxFlex="1" Required="true" ShowRedStar="true" Label="消息正文" runat="server">
                        </f:TextArea>
                    </Items>
                </f:Form>
            </Items>
            <Toolbars>
                <f:Toolbar runat="server" ToolbarAlign="Right" Position="Bottom">
                    <Items>
                        <f:Button ID="Button1" Text="发送" ValidateForms="Form1" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>

    </form>
</body>
</html>
