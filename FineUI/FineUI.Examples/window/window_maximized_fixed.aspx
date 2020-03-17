<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_maximized_fixed.aspx.cs" Inherits="FineUI.Examples.window.window_maximized_fixed" %>

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
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体"
            EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" CloseAction="HidePostBack" OnClose="Window2_Close" AutoScroll="true" BodyPadding="10px"
            Hidden="true" EnableMaximize="false">
            <Content>
                <p>
                    <a href="http://tech.163.com/special/jobsdead/" style="font-size: 18px" target="_blank"><b>乔布斯</b></a>
                </p>
                <p>
                    乔布斯于1955年2月24日出生，苹果创始人之一，近年来多次被评为全美最佳CEO，业界评论“苹果就是乔布斯，乔布斯就是苹果”。在乔布斯的带领下，苹果股价去年一路飙升，超越微软成为世界第一大科技公司，今年8月苹果超越埃克森美孚成为全球最大市值企业，截止上季度持有现金达到762亿美金，甚至超过了美国政府国库存款。
                </p>
                <p>
                    遗憾的是，苹果的取得巨大成功还是无法给乔布斯一个健康的身体，乔布斯2003年被发现患有胰脏癌，随后又查出肝癌，危在旦夕的乔布斯在经历了8年的抗癌斗争、3次病休、若干次手术后，于2011年8月25日正式宣布从CEO位置辞职转做公司董事长，原COO库克正式接任乔布斯任CEO。2011年10月6日，乔布斯在苹果发布iPhone 4S后的第二天与世长辞。
                </p>
            </Content>
        </f:Window>
    </form>
</body>
</html>
