<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_editor_cell_updatesummary.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_editor_cell_updatesummary" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .f-grid-row-summary .f-grid-cell-inner {
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="true" Width="850px"
            runat="server" DataKeyNames="Id,Name" AllowCellEditing="true" 
            ClicksToEdit="1" EnableSummary="true" SummaryPosition="Flow">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" EnablePostBack="false" runat="server">
                            <Listeners>
                                <f:Listener Event="click" Handler="onAddClick" />
                            </Listeners>
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" EnablePostBack="false" runat="server">
                            <Listeners>
                                <f:Listener Event="click" Handler="onDeleteClick" />
                            </Listeners>
                        </f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" EnablePostBack="false" runat="server">
                            <Listeners>
                                <f:Listener Event="click" Handler="onResetClick" />
                            </Listeners>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:TemplateField ColumnID="Number" Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:RenderField Width="100px" ColumnID="Name" DataField="Name" FieldType="String"
                    HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="Major" DataField="Major" FieldType="String"
                    ExpandUnusedSpace="true" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="ChineseScore" DataField="ChineseScore" FieldType="Int"
                    HeaderText="语文成绩">
                    <Editor>
                        <f:NumberBox ID="TextBox1" NoDecimal="true" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="MathScore" DataField="MathScore" FieldType="Int"
                    HeaderText="数学成绩">
                    <Editor>
                        <f:NumberBox ID="NumberBox1" NoDecimal="true" NoNegative="true" Required="true" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField ColumnID="Delete" Width="80px" RendererFunction="renderDelete"></f:RenderField>
            </Columns>
            <Listeners>
                <f:Listener Event="afteredit" Handler="onGridAfterEdit" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：编辑[语文成绩]或者[数学成绩]时会更新合计行数据。
    </form>
    <script>

        var grid1ClientID = '<%= Grid1.ClientID %>';

        function renderDelete() {
            return '<a href="javascript:;" class="action-btn delete"><img class="f-grid-imagefield" src="../res/icon/delete.png"></a>';
        }

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }


        function updateSummary() {
            var me = F(grid1ClientID), chineseTotal = 0, mathTotal = 0, allTotal = 0;
            me.getRowEls().each(function (index, tr) {
                chineseTotal += me.getCellValue(tr, 'ChineseScore');
                mathTotal += me.getCellValue(tr, 'MathScore');
            });

            // 第三个参数 true，强制更新，不显示左上角的更改标识
            me.updateSummaryCellValue('ChineseScore', chineseTotal, true);
            me.updateSummaryCellValue('MathScore', mathTotal, true);
        }

        function onGridAfterEdit(event, value, params) {
            updateSummary();
        }

        // 点击新增按钮
        function onAddClick() {
            F(grid1ClientID).addNewRecord({
                "Name": "新用户",
                "Gender": "1",
                "Major": "化学系",
                "ChineseScore": 0,
                "MathScore": 0
            }, true);
        }

        // 点击重置按钮
        function onResetClick() {
            F.confirm({
                message: '确定要重置表格数据？',
                ok: function () {
                    F(grid1ClientID).rejectChanges();

                    // 重置表格后，要记得更新合计行
                    updateSummary();
                }
            });
        }

        // 点击删除按钮
        function onDeleteClick() {
            var grid1 = F(grid1ClientID);
            if (!grid1.hasSelection()) {
                F.alert('请至少选择一项！');
                return false;
            }

            F.confirm({
                message: '删除选中行？',
                ok: function () {
                    grid1.deleteSelectedRows();

                    // 删除行后，要记得更新合计行
                    updateSummary();
                }
            });

        }
        
        // 页面渲染完毕
        F.ready(function () {

            // 注册表格行内删除事件
            var grid1 = F(grid1ClientID);
            grid1.el.on('click', '.action-btn.delete', function () {
                var targetEl = $(this);
                var rowEl = targetEl.parents('.f-grid-row');
                var rowData = grid1.getRowData(rowEl);

                F.confirm({
                    message: '删除选中行？',
                    ok: function () {
                        grid1.deleteRow(rowData.id);

                        // 删除行后，要记得更新合计行
                        updateSummary();
                    }
                });

            });

        });

    </script>
</body>
</html>
