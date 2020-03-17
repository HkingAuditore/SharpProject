<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_checkall.aspx.cs"
    Inherits="FineUI.Examples.tree.checkbox.tree_checkall" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" OnNodeCheck="Tree1_NodeCheck" Width="650px"  EnableCollapse="true"
            ShowHeader="true" Title="树控件" runat="server">
            <Nodes>
                <f:TreeNode Text="中国" EnableCheckBox="true" EnableCheckEvent="true" Expanded="true">
                    <f:TreeNode EnableCheckEvent="true" Text="河南省" EnableCheckBox="true" Expanded="true">
                        <f:TreeNode Text="驻马店市" EnableCheckEvent="true" EnableCheckBox="true" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" EnableCheckEvent="true" EnableCheckBox="true" NodeID="Suiping">
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" EnableCheckEvent="true" EnableCheckBox="true" NodeID="Xiping">
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" EnableCheckEvent="true" EnableCheckBox="true" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode EnableCheckEvent="true" EnableCheckBox="true" Text="安徽省" Expanded="true"
                        NodeID="Anhui">
                        <f:TreeNode EnableCheckBox="true" EnableCheckEvent="true" Text="合肥市" NodeID="Hefei">
                        </f:TreeNode>
                        <f:TreeNode EnableCheckBox="true" EnableCheckEvent="true" Text="黄山市" NodeID="Huangshan">
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
        </f:Tree>
    </form>
</body>
</html>
