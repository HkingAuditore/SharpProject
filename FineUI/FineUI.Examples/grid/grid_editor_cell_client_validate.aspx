<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_editor_cell_client_validate.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_editor_cell_client_validate" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格（双击编辑）" EnableCollapse="true" Width="850px"
            runat="server" DataKeyNames="Id,Name" AllowCellEditing="true" ClicksToEdit="2" OnPreDataBound="Grid1_PreDataBound" 
            DataIDField="Id">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" EnablePostBack="false" runat="server">
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" EnablePostBack="false" runat="server">
                        </f:Button>
                        <f:ToolbarFill runat="server">
                        </f:ToolbarFill>
                        <f:Button ID="btnReset" Text="重置表格数据" EnablePostBack="false" runat="server">
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
                <f:RenderField Width="100px" ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int"
                    HeaderText="入学年份">
                    <Editor>
                        <f:NumberBox ID="tbxEditorEntranceYear" NoDecimal="true" NoNegative="true" MinValue="2000"
                            MaxValue="2025" runat="server">
                        </f:NumberBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="120px" ColumnID="EntranceDate" DataField="EntranceDate" FieldType="Date"
                    Renderer="Date" RendererArgument="yyyy-MM-dd" HeaderText="入学日期">
                    <Editor>
                        <f:DatePicker ID="DatePicker1" Required="true" runat="server">
                        </f:DatePicker>
                    </Editor>
                </f:RenderField>
                <f:RenderCheckField Width="100px" ColumnID="AtSchool" DataField="AtSchool" HeaderText="是否在校" />
                <f:RenderField Width="100px" ColumnID="Major" DataField="Major" FieldType="String"
                    ExpandUnusedSpace="true" HeaderText="所学专业">
                    <Editor>
                        <f:TextBox ID="tbxEditorMajor" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:LinkButtonField ColumnID="Delete" Width="80px" EnablePostBack="false"
                    Icon="Delete" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClientClick="if(!isValid()){return false;}" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        注：保存数据前，验证“姓名”不能为空（现有数据可以简单通过 Required="true" 属性来控制，新增数据默认为空的话需要这个客户端验证）。
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        function isValid() {
            var grid1 = F('<%= Grid1.ClientID %>');
            var valid = true, modifiedData = grid1.f_getModifiedData();

            $.each(modifiedData, function (index, rowData) {

                // rowData.rowIndex: 行在当前表格中的索引（删除行小于0）,
                // rowData.originalIndex: 行在原始数据源中的索引（新增行小于0）,
                // rowData.id: 行ID
                // rowData.status: 行状态（newadded, modified, deleted）
                // rowData.values: 行中修改单元格对象，比如 { "Name": "刘国2", "Gender": 0, "EntranceYear": 2003 }
                if (rowData.status === 'deleted') {
                    return true; // continue
                }

                var name = rowData.values['Name'];
                // 更改了姓名列，并且为空字符串
                if (typeof (name) != 'undefined' && $.trim(name) == '') {
                    F.alert({
                        message: '姓名不能为空！',
                        ok: function () {
                            grid1.f_startEdit(rowData.id, 'Name');
                        }
                    });

                    valid = false;

                    return false; // break
                }
            });


            return valid;
        }




    </script>
</body>
</html>
