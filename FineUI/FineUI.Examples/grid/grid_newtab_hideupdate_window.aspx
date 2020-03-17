<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="grid_newtab_hideupdate_window.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_newtab_hideupdate_window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server" />
        <f:Form ID="SimpleForm1" ShowBorder="false" ShowHeader="false"
            AutoScroll="true" BodyPadding="10px" runat="server">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnClose" EnablePostBack="false" Text="关闭当前选项卡" runat="server">
                        </f:Button>
                        <f:Button ID="btnCloseRefresh" Text="关闭当前标签页并更新父选项卡（传入申请日期）" runat="server" ValidateForms="SimpleForm1" OnClick="btnCloseRefresh_Click">
                        </f:Button>
                        <f:ToolbarFill ID="ToolbarFill1" runat="server">
                        </f:ToolbarFill>
                        <f:ToolbarText ID="ToolbarText1" Text="提示一" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText ID="ToolbarText2" Text="提示二&nbsp;&nbsp;" runat="server">
                        </f:ToolbarText>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Rows>
                <f:FormRow>
                    <Items>
                        <f:Label ID="labUserName" Label="申请人" Text="三生石上" CssClass="highlight" runat="server" />
                        <f:Label ID="Label3" Label="电话" Text="0551-1234567" runat="server" />
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:NumberBox ID="NumberBox1" Text="10" NoDecimal="true" NoNegative="true" Label="数量" Required="true" ShowRedStar="true" runat="server" />
                        <f:DatePicker ID="DatePicker1" Required="True" ShowRedStar="true" runat="server" EnableEdit="false"
                            SelectedDate="2008-05-09" Label="申请日期" Text="2008-05-09">
                        </f:DatePicker>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea2" Height="80px" Label="描述" runat="server"/>
                    </Items>
                </f:FormRow>
                <f:FormRow>
                    <Items>
                        <f:TextArea ID="TextArea1" Height="150px" Label="详细描述" runat="server" />
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </form>
</body>
</html>
