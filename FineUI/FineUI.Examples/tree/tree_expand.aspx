<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_expand.aspx.cs" Inherits="FineUI.Examples.tree.tree_expand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" Width="650px" ShowHeader="true" OnNodeExpand="Tree1_NodeExpand"
            OnNodeCollapse="Tree1_NodeCollapse" Title="树控件"  EnableCollapse="true"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true">
                    <f:TreeNode Text="河南省" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true">
                        <f:TreeNode Text="驻马店市" EnableExpandEvent="true" EnableCollapseEvent="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" EnableExpandEvent="true" EnableCollapseEvent="true" Leaf="false" NodeID="suiping">
                                <f:TreeNode Text="槐树乡" EnableExpandEvent="true" EnableCollapseEvent="true" Leaf="false" NodeID="huaishu">
                                    <f:TreeNode Text="陈庄村" NodeID="chenzhuang">
                                    </f:TreeNode>
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" EnableExpandEvent="true" EnableCollapseEvent="true" Expanded="true" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
        <f:Label runat="server" ID="labResult"></f:Label>
    </form>
</body>
</html>
