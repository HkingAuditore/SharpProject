<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_simulate_tree_paging.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_simulate_tree_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格"  EnableCollapse="true" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="True" AllowPaging="true" PageSize="15" IsDatabasePaging="false"
            DataKeyNames="Id,Name" Width="800px" Height="450px" OnPageIndexChange="Grid1_PageIndexChange">
            <Columns>
                <f:BoundField DataField="Name" DataSimulateTreeLevelField="TreeLevel" DataFormatString="{0}"
                    HeaderText="地区" ExpandUnusedSpace="True" />
                <f:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组"></f:ImageField>
            </Columns>
        </f:Grid>
    </form>
</body>
</html>
