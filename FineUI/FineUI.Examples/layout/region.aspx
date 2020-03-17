<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="region.aspx.cs" Inherits="FineUI.Examples.layout.region" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server" />
        <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false" Layout="Region">
            <Items>
                <f:Panel runat="server" ID="panelTopRegion" RegionPosition="Top" RegionSplit="true" EnableCollapse="true" Height="100px"
                    Title="顶部面板" ShowBorder="true" ShowHeader="true" BodyPadding="5px">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="顶部面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelLeftRegion" RegionPosition="Left" RegionSplit="true" EnableCollapse="true"
                    Width="200px" Title="左侧面板" ShowBorder="true" ShowHeader="true" BodyPadding="5px">
                    <Items>
                        <f:Label ID="Label2" runat="server" Text="左侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelCenterRegion" RegionPosition="Center"
                    Title="中间面板" ShowBorder="true" ShowHeader="true" BodyPadding="5px">
                    <Items>
                        <f:Label ID="Label3" runat="server" Text="中间面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelRightRegion" RegionPosition="Right" RegionSplit="true" EnableCollapse="true"
                    Width="200px" Title="右侧面板" ShowBorder="true" ShowHeader="true" BodyPadding="5px">
                    <Items>
                        <f:Label ID="Label4" runat="server" Text="右侧面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
                <f:Panel runat="server" ID="panelBottomRegion" RegionPosition="Bottom" RegionSplit="true" EnableCollapse="true" Height="100px"
                    Title="底部面板" ShowBorder="true" ShowHeader="true" BodyPadding="5px">
                    <Items>
                        <f:Label ID="Label5" runat="server" Text="底部面板的内容">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
