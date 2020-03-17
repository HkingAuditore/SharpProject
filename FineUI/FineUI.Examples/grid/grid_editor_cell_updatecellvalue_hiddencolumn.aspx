<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_editor_cell_updatecellvalue_hiddencolumn.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_editor_cell_updatecellvalue_hiddencolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格（单击编辑）" EnableCollapse="true" Width="850px"
            runat="server" DataKeyNames="Id,Name"
            AllowCellEditing="true" ClicksToEdit="1" DataIDField="Id">
            <Columns>
                <f:TemplateField Width="60px">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:RenderField Width="100px" ColumnID="Name" DataField="Name" FieldType="String"
                    HeaderText="姓名">
                    <Editor>
                        <f:TextBox ID="tbxEditorName" Required="true" runat="server">
                        </f:TextBox>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="Gender" DataField="Gender" FieldType="Int"
                    RendererFunction="renderGender" HeaderText="性别">
                    <Editor>
                        <f:DropDownList ID="ddlGender" Required="true" runat="server">
                            <f:ListItem Text="男" Value="1" />
                            <f:ListItem Text="女" Value="0" />
                        </f:DropDownList>
                    </Editor>
                </f:RenderField>
                <f:RenderField Width="100px" ColumnID="EntranceYear" DataField="EntranceYear" FieldType="Int" Hidden="true"
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
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="将全部[入学年份]加一" EnablePostBack="false">
            <Listeners>
                <f:Listener Event="click" Handler="onButtonClick" />
            </Listeners>
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="保存数据" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        注：
        <ul>
            <li>页面加载时[入学年份]列处于隐藏状态</li>
            <li>保持[入学年份]列的隐藏状态，点击第一个更新按钮，然后点击[保存数据]按钮</li>
        </ul>
    </form>
    <script>

        function renderGender(value) {
            return value == 1 ? '男' : '女';
        }

        var gridClientID = '<%= Grid1.ClientID %>';
        var labResultClientID = '<%= labResult.ClientID %>';

        function onButtonClick() {
            var grid = F(gridClientID);

            var msg = [];
            grid.getRowEls().each(function () {
                var rowEl = $(this);
                var entranceYear = grid.getCellValue(rowEl, 'EntranceYear');
                var userName = grid.getCellValue(rowEl, 'Name');

                grid.updateCellValue(rowEl, 'EntranceYear', entranceYear + 1);

                msg.push('[' + userName + ']的入学年份：' + entranceYear + ' -> ' + (entranceYear + 1));
            });


            F(labResultClientID).setValue(msg.join('<br>'));
        }

    </script>
</body>
</html>
