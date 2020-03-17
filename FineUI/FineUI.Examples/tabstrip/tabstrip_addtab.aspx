<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_addtab.aspx.cs"
    Inherits="FineUI.Examples.tabstrip.tabstrip_addtab" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" Width="950px" Height="350px" ShowBorder="true" ActiveTabIndex="0" 
            runat="server">
            <Tabs>
                <f:Tab Title="FineUI 论坛" EnableIFrame="true" IFrameUrl="http://fineui.com/bbs/" runat="server">
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:Button ID="btnAddTab1" CssClass="marginr" Text="专业版（客户端代码）"
            EnablePostBack="false" runat="server">
        </f:Button>
        <f:Button ID="btnAddTab2" CssClass="marginr" Text="开源版（客户端代码）"
            EnablePostBack="false" runat="server">
        </f:Button>
        <f:Button ID="btnRemoveTab1" CssClass="marginr" Text="删除专业版（客户端代码）"
            EnablePostBack="false" runat="server">
        </f:Button>
        <f:Button ID="btnRemoveTab2" CssClass="marginr" Text="删除开源版（客户端代码）"
            EnablePostBack="false" runat="server">
        </f:Button>
        <br />
        <br />
        <f:Button ID="btnAddTab3" CssClass="marginr" Text="专业版示例（服务端代码）"
            runat="server" OnClick="btnAddTab3_Click">
        </f:Button>
        <f:Button ID="btnAddTab4" CssClass="marginr" Text="开源版版示例（服务端代码）"
            runat="server" OnClick="btnAddTab4_Click">
        </f:Button>
        <f:Button ID="btnRemoveTab3" CssClass="marginr" Text="删除专业版示例（服务端代码）"
            runat="server" OnClick="btnRemoveTab3_Click">
        </f:Button>
        <f:Button ID="btnRemoveTab4" CssClass="marginr" Text="删除开源版版示例（服务端代码）"
            runat="server" OnClick="btnRemoveTab4_Click">
        </f:Button>
        <br />
        <br />
        <br />
        <br />
        注意：这些标签都是通过JavaScript脚本添加的，因此服务端无法取得这些动态添加的标签。
    <br />
        如果不使用Ajax回发页面，则所有动态添加的标签都会消失。
    <br />
    </form>
</body>
</html>
