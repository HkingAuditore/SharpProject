<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_style_rowcolor_paging.aspx.cs"
    Inherits="FineUI.Examples.data.grid_style_rowcolor_paging" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .x-grid-item.highlight td {
            background-color: lightgreen;
            background-image: none;
        }

        .x-grid-item-selected.highlight td {
            background-color: yellow;
            background-image: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格" EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="800px"
            runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name" OnRowDataBound="Grid1_RowDataBound"
            AllowPaging="true" PageSize="5" OnPageIndexChange="Grid1_PageIndexChange">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组"></f:ImageField>
            </Columns>
        </f:Grid>
        <br />
        注：
        <ul>
            <li>这个表格高亮选中了所有[入学年份]大于等于2006的数据行</li>
            <li><strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong></li>
        </ul>
        <br />
        <br />
        
        <br />
        <br />
        <br />

        <f:HiddenField ID="highlightRows" runat="server">
        </f:HiddenField>
        <f:HiddenField ID="currentPageIndex" runat="server">
        </f:HiddenField>
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var highlightRowsClientID = '<%= highlightRows.ClientID %>';
        var currentPageIndexClientID = '<%= currentPageIndex.ClientID %>';
        var gridClientID = '<%= Grid1.ClientID %>';

        function highlightRows() {
            // 增加延迟，等待HiddenField更新完毕
            window.setTimeout(function () {
                var highlightRows = F(highlightRowsClientID);
                var grid = F(gridClientID);

                // 当前表格所处的分页序号
                var currentPageIndex = F(currentPageIndexClientID).getValue() || 0;
                currentPageIndex = parseInt(currentPageIndex, 10);

                $(grid.el.dom).find('.x-grid-item.highlight').removeClass('highlight');

                $.each(highlightRows.getValue().split(','), function (index, item) {
                    if (item !== '') {
                        // pageSize: 5, pageIndex: currentPageIndex
                        var row = grid.getView().getNode(parseInt(item, 10) - currentPageIndex * 5);
                        $(row).addClass('highlight');
                    }
                });
            }, 100);
        }

        // 页面第一个加载完毕后执行的函数
        F.ready(function () {

            var grid = F(gridClientID);

            grid.on('columnhide', function () {
                highlightRows();
            });

            grid.on('columnshow', function () {
                highlightRows();
            });

            grid.getStore().on('refresh', function () {
                highlightRows();
            });

            highlightRows();

        });

        //// 页面AJAX回发后执行的函数
        //F.ajaxReady(function () {
        //    highlightRows();
        //});
    </script>
</body>
</html>
