<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_ajax.aspx.cs" Inherits="FineUI.Examples.data.tree_ajax" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" OnNodeLazyLoad="Tree1_NodeLazyLoad" Width="650px" EnableCollapse="true"
            ShowHeader="true" Title="延迟加载的树控件" AutoLeafIdentification="false" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省" Expanded="true">
                        <f:TreeNode Text="驻马店市（此节点延迟加载）" NodeID="zhumadian">
                        </f:TreeNode>
                        <f:TreeNode Text="漯河" NodeID="luohe" Leaf="true" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden" Leaf="true">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc" Leaf="true">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
