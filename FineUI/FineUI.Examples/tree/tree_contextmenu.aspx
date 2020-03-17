<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_contextmenu.aspx.cs" Inherits="FineUI.Examples.tree.tree_contextmenu" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" Width="550px" ShowHeader="true" Title="树控件（右键菜单）" EnableCollapse="true" EnableSingleClickExpand="false"
            runat="server">
            <Nodes>
                <f:TreeNode Text="中国" Expanded="true">
                    <f:TreeNode Text="河南省">
                        <f:TreeNode Text="驻马店市" NodeID="zhumadian">
                            <f:TreeNode Text="遂平县" Leaf="false" NodeID="suiping">
                                <f:TreeNode Text="槐树乡" Leaf="false" NodeID="huaishu">
                                    <f:TreeNode Text="陈庄村" NodeID="chenzhuang">
                                    </f:TreeNode>
                                </f:TreeNode>
                                <f:TreeNode Text="嵖岈山乡" NodeID="chayashanxiang">
                                </f:TreeNode>
                            </f:TreeNode>
                            <f:TreeNode Text="西平县" Leaf="false" NodeID="xiping">
                                <f:TreeNode Text="芦庙乡" NodeID="lumiaoxiang">
                                </f:TreeNode>
                                <f:TreeNode Text="杨庄乡" NodeID="yangzhuangxiang">
                                </f:TreeNode>
                            </f:TreeNode>
                        </f:TreeNode>
                        <f:TreeNode Text="漯河市" NodeID="luohe" />
                    </f:TreeNode>
                    <f:TreeNode Text="安徽省" Expanded="true" NodeID="anhui">
                        <f:TreeNode Text="合肥市" Expanded="true" NodeID="hefei">
                            <f:TreeNode Text="金色池塘小区" NodeID="golden">
                            </f:TreeNode>
                            <f:TreeNode Text="中国科学技术大学" NodeID="ustc">
                            </f:TreeNode>
                        </f:TreeNode>
                    </f:TreeNode>
                </f:TreeNode>
            </Nodes>
            <Listeners>
                <f:Listener Event="beforeitemcontextmenu" Handler="onTreeNodeContextMenu" />
            </Listeners>
        </f:Tree>
        <f:Menu ID="Menu1" runat="server">
            <Items>
                <f:MenuButton ID="btnExpandNode" EnablePostBack="false" runat="server" Text="展开全部">
                    <Listeners>
                        <f:Listener Event="click" Handler="onExpandNode" />
                    </Listeners>
                </f:MenuButton>
                <f:MenuButton ID="btnCollapseNode" EnablePostBack="false" runat="server" Text="折叠全部">
                    <Listeners>
                        <f:Listener Event="click" Handler="onCollapseNode" />
                    </Listeners>
                </f:MenuButton>
            </Items>
            <Listeners>
                <f:Listener Event="show" Handler="onMenuShow" />
            </Listeners>
        </f:Menu>
    </form>
    <br />
    注：在叶子节点上点击右键，则弹出菜单的菜单项都是禁用状态。
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script>

        var treeID = '<%= Tree1.ClientID %>';
        var menuID = '<%= Menu1.ClientID %>';
        // 保存当前菜单对应的树节点ID
        var currentNodeId;

        // 返回false，来阻止浏览器右键菜单
        function onTreeNodeContextMenu(view, record, item, index, event) {
            currentNodeId = record.getId();

            F(menuID).showAt(event.getXY());

            event.stopEvent();
        }

        // 设置所有菜单项的禁用状态
        function setMenuItemsDisabled(disabled) {
            var menu = F(menuID);
            $.each(menu.items.items, function (index, item) {
                disabled ? item.disable() : item.enable();
            });
        }

        // 显示菜单后，检查是否禁用菜单项
        function onMenuShow() {
            if (currentNodeId) {
                var tree = F(treeID);
                var store = tree.getStore();

                var nodeData = store.getById(currentNodeId);
                if (nodeData.data.leaf) {
                    setMenuItemsDisabled(true);
                } else {
                    setMenuItemsDisabled(false);
                }
            }
        }

        function onExpandNode() {
            if (currentNodeId) {
                var tree = F(treeID);
                var store = tree.getStore();
                
                tree.expandNode(store.getById(currentNodeId), true);
            }
        }

        function onCollapseNode() {
            if (currentNodeId) {
                var tree = F(treeID);
                var store = tree.getStore();

                tree.collapseNode(store.getById(currentNodeId), true);
            }
        }

    </script>
</body>
</html>
