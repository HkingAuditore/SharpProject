<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_checkboxfield_rowcheckall_clientside.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_checkboxfield_rowcheckall_clientside" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格"  EnableCollapse="true" Width="800px" ShowBorder="true" ShowHeader="true"
            runat="server" DataKeyNames="Id,Name">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button2" EnablePostBack="false" runat="server" Text="全选/取消">
                            <Menu ID="Menu1" runat="server">
                                <f:MenuButton ID="btnSelectRows" EnablePostBack="false" runat="server" Text="全选选中行">
                                    <Listeners>
                                        <f:Listener Event="click" Handler="onSelectRows" />
                                    </Listeners>
                                </f:MenuButton>
                                <f:MenuButton ID="btnUnselectRows" EnablePostBack="false" runat="server" Text="取消选中行">
                                    <Listeners>
                                        <f:Listener Event="click" Handler="onUnselectRows" />
                                    </Listeners>
                                </f:MenuButton>
                            </Menu>
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" ExpandUnusedSpace="true" DataField="Name" DataFormatString="{0}"
                    HeaderText="姓名" />
                <f:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField1" Width="100px" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校1" />
                <f:CheckBoxField ColumnID="CheckBoxField2" Width="100px" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校2" />
                <f:CheckBoxField ColumnID="CheckBoxField3" Width="100px" RenderAsStaticField="false"
                    DataField="AtSchool" HeaderText="是否在校3" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行复选框的状态" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script>

        function onSelectRows() {
            var selectedRows = $('.x-grid-item-selected');
            if (selectedRows.length) {
                selectedRows.find('.f-grid-checkbox').removeClass('unchecked').addClass('checked');
            } else {
                alert("请至少选择一项！");
            }
        }

        function onUnselectRows() {
            var selectedRows = $('.x-grid-item-selected');
            if (selectedRows.length) {
                selectedRows.find('.f-grid-checkbox').removeClass('checked').addClass('unchecked');
            } else {
                alert("请至少选择一项！");
            }
        }



        //var selectRowsID = '<%= btnSelectRows.ClientID %>';
        //var unselectRowsID = '<%= btnUnselectRows.ClientID %>';
        
        //F.ready(function () {

        //    F(selectRowsID).on('click', function () {
        //        $('.x-grid-item-selected img.f-grid-checkbox').removeClass('unchecked').addClass('checked');
        //    });

        //    F(unselectRowsID).on('click', function () {
        //        $('.x-grid-item-selected img.f-grid-checkbox').removeClass('checked').addClass('unchecked');
        //    });

        //});

    </script>
</body>
</html>
