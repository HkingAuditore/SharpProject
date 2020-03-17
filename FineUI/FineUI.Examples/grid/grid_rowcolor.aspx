<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcolor.aspx.cs"
    Inherits="FineUI.Examples.data.grid_rowcolor" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .x-grid-row.highlight td
        {
            background-color: lightgreen;
        }
        .x-grid-row.highlight .x-grid-col
        {
            background-image: none;
        }
        
        .x-grid-row-selected.highlight td
        {
            background-color: yellow;
        }
        .x-grid-row-selected.highlight .x-grid-col
        {
            background-image: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <x:PageManager ID="PageManager1" runat="server" />
    <x:Grid ID="Grid1" Title="表格" EnableFrame="true" EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="800px"
        runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound"
       >
        <Columns>
            <x:RowNumberField />
            <x:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
            <x:TemplateField Width="80px" HeaderText="性别">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                </ItemTemplate>
            </x:TemplateField>
            <x:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
            <x:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
            <x:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                DataNavigateUrlFieldsEncode="true" Target="_blank" ExpandUnusedSpace="True" />
            <x:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/images/16/{0}.png"
                HeaderText="分组"></x:ImageField>
        </Columns>
    </x:Grid>
    <br />
    注意：这个表格高亮选中了所有“入学年份”大于等于2006的数据行。
    <br />
    <br />
    <x:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
    </x:Button>
    <br />
    <br />
    <br />
    <br />
    <x:HiddenField ID="highlightRows" runat="server">
    </x:HiddenField>
    </form>
    <script type="text/javascript">
        var highlightRowsClientID = '<%= highlightRows.ClientID %>';
        var gridClientID = '<%= Grid1.ClientID %>';

        function highlightRows() {
            var highlightRows = X(highlightRowsClientID);
            var grid = X(gridClientID);

            grid.el.select('.x-grid-row table.highlight').removeCls('highlight');

            Ext.Array.each(highlightRows.getValue().split(','), function (item, index) {
                if (item !== '') {
                    var row = grid.getView().getNode(parseInt(item, 10));
                    Ext.get(row).addCls('highlight');
                }
            });

        }

        // 页面第一个加载完毕后执行的函数
        function onReady() {
            highlightRows();
        }

        // 页面AJAX回发后执行的函数
        function onAjaxReady() {
            highlightRows();
        }
    </script>
</body>
</html>
