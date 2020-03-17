﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tree_singleexpand.aspx.cs" Inherits="FineUI.Examples.tree.tree_singleexpand" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Tree ID="Tree1" Width="550px" ShowHeader="true" Title="树控件（EnableSingleExpand）"
            EnableCollapse="true" EnableSingleClickExpand="false" EnableSingleExpand="true"
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
        </f:Tree>
    </form>
    <br />
    注：启用了 EnableSingleExpand，也就是说同一级节点同时只能展开一个（初始状态除外）。
</body>
</html>
