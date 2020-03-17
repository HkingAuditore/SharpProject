<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="empty.aspx.cs" Inherits="FineUI.Examples.test.empty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:Literal runat="server" ID="testLit"></asp:Literal>
</head>
<body>
    <form id="form1" runat="server">

        <f:PageManager ID="PageManager1" AutoSizePanelID="regionPanel" runat="server" />
        <f:Panel Layout="Region" ID="regionPanel" ShowBorder="false" ShowHeader="false" runat="server">
            <Items>
                <f:Panel ID="topPanel" CssClass="topregion" RegionPosition="Top" ShowBorder="false" ShowHeader="false"
                    EnableCollapse="true" runat="server">
                    <Content>
                        <div id="header" class="ui-widget-header f-mainheader" style="background-color: #333333">
                            <img src="./res/images/login/login_10.png" class="logoimg" alt="Logo" />
                            <asp:HyperLink ID="linkSystemTitle" CssClass="logo" runat="server" NavigateUrl="~/main.aspx"></asp:HyperLink>
                        </div>
                    </Content>
                    <Toolbars>
                        <f:Toolbar ID="topRegionToolbar" Position="Bottom" runat="server">
                            <Items>
                                <f:ToolbarText ID="lblUser" Text="lblUser" runat="server"></f:ToolbarText>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server"></f:ToolbarSeparator>
                                <f:ToolbarText ID="txtOnlineUserCount" Text="txtOnlineUserCount" runat="server"></f:ToolbarText>
                                <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server"></f:ToolbarSeparator>
                                <f:ToolbarText ID="txtCurrentTime" Text="txtCurrentTime" runat="server"></f:ToolbarText>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server"></f:ToolbarFill>
                                <f:Button ID="btnHelp" EnablePostBack="false" Icon="Help" Text="帮助" runat="server"></f:Button>
                                <f:Button ID="Button2" runat="server" Icon="UserRed" Text="安全退出" ConfirmText="确定退出系统？"></f:Button>
                                <f:Button ID="btnChange" runat="server" Icon="UserGo" Text="切换" Hidden="true" EnablePostBack="false" HideMode="Display"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:Panel>
                <f:Panel ID="leftPanel" CssClass="leftregion" RegionSplit="true" EnableCollapse="true" Width="250px"
                    ShowHeader="true" ShowBorder="true" Title="系统菜单" Layout="Fit" RegionPosition="Left" runat="server">
                </f:Panel>
                <f:TabStrip ID="mainTabStrip" EnableTabCloseMenu="true" ShowBorder="true" runat="server">
                    <Tabs>
                        <f:Tab ID="Tab1" Title="首页" EnableIFrame="true" IFrameUrl="~/admin/default.aspx"
                            Icon="House" runat="server">
                        </f:Tab>
                    </Tabs>

                </f:TabStrip>
            </Items>
        </f:Panel>

        <f:Window ID="winShangBaoKouFen" runat="server" Title="按照所选定标准进行对应扣分" IsModal="true" EnableClose="true" EnableResize="false"
            Width="650px" MinHeight="340px" Layout="Fit" Hidden="true" Icon="BasketAdd">
            <Items>

                <f:Form runat="server" ID="formaShangBaoKouFen" Title="按照所选定标准进行对应扣分" ShowHeader="false"
                    MessageTarget="Qtip" ShowBorder="false" LabelWidth="100px" LabelAlign="Top" Layout="HBox" BoxConfigAlign="Stretch" BoxConfigPosition="Left" BoxConfigChildMargin="0 3 0 3">
                    <Items>
                        <f:Panel runat="server" ID="panRiQi" ShowBorder="false" ShowHeader="false" BoxFlex="1" Layout="VBox" BoxConfigAlign="Center" BoxConfigPosition="Center">
                            <Items>
                                <f:Label runat="server" ID="labRiQi" Text="111" ShowEmptyLabel="true" ShowLabel="false"></f:Label>
                                <f:Calendar runat="server" ID="calFaShengRiQi" DateFormatString="yyyy-MM-dd" EnableDateSelectEvent="true"></f:Calendar>
                            </Items>
                        </f:Panel>

                        <f:Panel runat="server" ID="panKouFenXingXi" ShowBorder="false" ShowHeader="false" Layout="VBox" BoxFlex="2">
                            <Items>
                                <f:TextArea runat="server" ID="taKouFenTiaoJian" Label="扣分条件" Readonly="true" Margin="7 0 0 0" AutoGrowHeight="true" AutoGrowHeightMax="60px" AutoGrowHeightMin="5px"></f:TextArea>
                                <f:Label runat="server" ID="labKouFenBiaoZhun" Label="扣分标准" Readonly="true" ShowLabel="false"></f:Label>
                                <f:Panel runat="server" ID="panKouFenZhi" ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigAlign="Stretch" BoxConfigPosition="Left">
                                    <Items>
                                        <f:NumberBox runat="server" ID="nbWenTiJianShu" MinLength="1" Label="发生问题件数" MinValue="1" BoxFlex="1" Margin="0 4 0 0"></f:NumberBox>
                                        <f:NumberBox runat="server" ID="nbMeiJianKouFen" Label="每件问题扣分值" MinValue="0" DecimalPrecision="1" BoxFlex="1" Margin="0 0 0 4"
                                            Required="true" CompareMessage="必须填写扣分值">
                                        </f:NumberBox>
                                    </Items>
                                </f:Panel>
                                <f:TextArea runat="server" ID="textKouFenYuanYing" Label="扣分原因" EmptyText="请在此填写此次扣分的原因" Required="true" CompareMessage="必须填写扣分具体原因"></f:TextArea>
                            </Items>
                        </f:Panel>
                    </Items>
                    <Toolbars>
                        <f:Toolbar runat="server" ID="tool2" Position="Bottom" ToolbarAlign="Center">
                            <Items>
                                <f:Button runat="server" ID="btnQueRenKouFen" Text="确认扣分" ConfirmText="确认要对车间进行此项扣分吗？"
                                    ConfirmTitle="请确认" ConfirmTarget="Top" Icon="ApplicationFormAdd" ValidateForms="formaShangBaoKouFen" ValidateTarget="Top">
                                </f:Button>
                                <f:Button runat="server" ID="btnChongZhiBiaoDan" Text="重新填写" Icon="ApplicationFormMagnify"></f:Button>
                                <f:Button runat="server" ID="btnQuXiao" Text="取消" Icon="ApplicationCascade"></f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:Form>
            </Items>
        </f:Window>


    </form>

</body>
</html>
