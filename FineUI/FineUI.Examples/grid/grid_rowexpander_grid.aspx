<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_grid.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_rowexpander_grid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_rowexpander_grid_data.ashx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="true"
            runat="server" DataKeyNames="Id,Name" DataIDField="Id">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" ColumnID="Name" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField Width="80px" TextAlign="Right" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </f:ImageField>
                <f:BoundField Width="100px" DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}"
                    HeaderText="注册日期" />
                <f:TemplateField ColumnID="expander" RenderAsRowExpander="true">
                    <ItemTemplate>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script>

        var grid1 = '<%= Grid1.ClientID %>';

        F.ready(function () {
            var grid1Cmp = F(grid1);

            // 展开行扩展列事件
            grid1Cmp.view.on('expandbody', function (rowNode, record, expandRow) {

                var tplEl = Ext.get(expandRow).query('.f-grid-tpl')[0];
                if (!Ext.String.trim(tplEl.innerHTML)) {

                    var store = F.create('Ext.data.Store', {
                        fields: ['type', 'yuwen', 'shuxue', 'yingwen', 'wuli', 'huaxue'],
                        proxy: {
                            type: 'ajax',
                            url: './grid_rowexpander_grid_data.ashx?id=' + record.getId(),
                            reader: {
                                type: 'json',
                                root: 'data',
                                totalProperty: 'total'
                            }
                        },
                        autoLoad: true,
                        listeners: {
                            load: function () {
                                rowExpandersDoLayout();
                            }
                        }
                    });

                    F.create('Ext.grid.Panel', {
                        renderTo: tplEl,
                        header: false,
                        border: true,
                        draggable: false,
                        enableDragDrop: false,
                        enableColumnResize: false,
                        cls: 'gridinrowexpander',
                        store: store,
                        columns: [{
                            text: '', dataIndex: 'type', sortable: false, menuDisabled: true, width: 80
                        }, {
                            text: '语文', dataIndex: 'yuwen', sortable: false, menuDisabled: true, width: 80
                        }, {
                            text: '数学', dataIndex: 'shuxue', sortable: false, menuDisabled: true, width: 80
                        }, {
                            text: '英文', dataIndex: 'yingwen', sortable: false, menuDisabled: true, width: 80
                        }, {
                            text: '物理', dataIndex: 'wuli', sortable: false, menuDisabled: true, width: 80
                        }, {
                            text: '化学', dataIndex: 'huaxue', sortable: false, menuDisabled: true, width: 80
                        }, {
                            text: '平均成绩', flex: 1, sortable: false, menuDisabled: true,
                            renderer: function (value, metaData, record) {
                                var total = 0;

                                var kemuList = ['yuwen', 'shuxue', 'yingwen', 'wuli', 'huaxue'];
                                $.each(kemuList, function (index, item) {
                                    total += record.data[item];
                                });

                                return Math.round(total / kemuList.length);
                            }
                        }]
                    });
                } else {
                    rowExpandersDoLayout();
                }
            });

            // 折叠行扩展列事件
            grid1Cmp.view.on('collapsebody', function (rowNode, record, expandRow) {
                rowExpandersDoLayout();
            });

        });


        // 重新布局表格和行扩展列中的表格（解决出现纵向滚动条时的布局问题）
        function rowExpandersDoLayout() {
            var grid1Cmp = F(grid1);

            grid1Cmp.doLayout();

            $('.x-grid-item:not(.x-grid-item-collapsed) .gridinrowexpander').each(function () {
                var gridInside = F($(this).attr('id'));
                gridInside.doLayout();
            });
        }

    </script>
</body>
</html>
