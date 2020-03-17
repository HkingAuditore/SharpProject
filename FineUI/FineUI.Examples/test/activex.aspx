<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activex.aspx.cs" Inherits="FineUI.Examples.window.activex" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnShowInServer" CssClass="marginr" Text="显示窗体（服务端代码）" runat="server"
            OnClick="btnShowInServer_Click">
        </f:Button>
        <f:Button ID="btnHideInServer" Text="隐藏窗体（服务端代码）" runat="server" OnClick="btnHideInServer_Click">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnShowInClient" CssClass="marginr" Text="显示窗体（客户端代码）" EnablePostBack="false"
            runat="server">
        </f:Button>
        <f:Button ID="btnHideInClient" CssClass="marginr" Text="隐藏窗体（客户端代码）" EnablePostBack="false"
            runat="server">
        </f:Button>
        <f:Button ID="btnHideInClient2" Text="隐藏窗体，带回发参数（客户端代码）" EnablePostBack="false"
            runat="server">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnMenu" Text="中国科学技术大学" EnablePostBack="false" runat="server">
            <Menu ID="Menu1" runat="server">
                <f:MenuHyperLink ID="MenuHyperLink1" runat="server" Icon="TagGreen" Target="_blank" NavigateUrl="http://scms.ustc.edu.cn/"
                    Text="化学与材料科学学院">
                </f:MenuHyperLink>
                <f:MenuHyperLink ID="MenuHyperLink2" runat="server" Icon="TagBlue" Target="_blank" NavigateUrl="http://business.ustc.edu.cn/zh_CN/"
                    Text="管理学院">
                    <Menu ID="Menu2" runat="server">
                        <f:MenuHyperLink ID="MenuHyperLink3" runat="server" Icon="TagPink" Target="_blank" NavigateUrl="http://is.ustc.edu.cn/"
                            Text="工商管理系">
                        </f:MenuHyperLink>
                        <f:MenuHyperLink ID="MenuHyperLink4" runat="server" Icon="TagPurple" Target="_blank" NavigateUrl="http://stat.ustc.edu.cn/"
                            Text="统计与金融系">
                        </f:MenuHyperLink>
                    </Menu>
                </f:MenuHyperLink>
            </Menu>
        </f:Button>
        <f:DatePicker runat="server" Required="true" Label="开始日期" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期"
            ID="DatePicker1" ShowRedStar="True">
        </f:DatePicker>
        <br />
        <br />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" Hidden="false"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" CloseAction="HidePostBack" OnClose="Window2_Close" AutoScroll="true" BodyPadding="10px" EnableIFrame="true" IFrameUrl="~/jedrek.html">
        </f:Window>

        <f:Window ID="Window1" Width="650px" Height="300px" Icon="TagBlue" Title="窗体2" Hidden="false"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" CloseAction="HidePostBack" OnClose="Window2_Close" AutoScroll="true" BodyPadding="10px" EnableIFrame="true" IFrameUrl="~/jedrek.html">
        </f:Window>


        <object width="800" height="500" id="LODOP_OB2" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA">
            <param name="Caption" value="打印控件已安装好">
            <param name="Color" value="-16777201">
            <param name="CompanyName" value="">
            <param name="Border" value="1">
            <param name="Inbrowse" value="0">
            <param name="License" value="">
            <param name="LicenseA" value="">
            <param name="LicenseB" value="">
            <param name="Version" value="6.1.9.4">
            <param name="intVersion" value="6194">
            <embed width="0" height="0" id="LODOP_EM" pluginspage="install_lodop32.exe" type="application/x-print-lodop">
        </object>

    </form>
    <script>

        Ext.useShims = true;

    </script>
</body>
</html>
