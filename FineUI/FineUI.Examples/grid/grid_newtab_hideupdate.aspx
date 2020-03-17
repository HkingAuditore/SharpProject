<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_newtab_hideupdate.aspx.cs" Inherits="FineUI.Examples.grid.grid_newtab_hideupdate" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_newtab_hideupdate_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格"  EnableCollapse="true" ShowBorder="true" ShowHeader="true"
            PageSize="3" runat="server" EnableCheckBoxSelect="True" DataKeyNames="Id,Name"
            Width="800px">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="btnNew" Text="新增数据" Icon="Add" EnablePostBack="false" runat="server">
                        </f:Button>
                        <f:Button ID="btnDelete" Text="删除选中行" Icon="Delete" OnClick="btnDelete_Click" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
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
                <f:TemplateField HeaderText="新标签页打开" Width="100px">
                    <ItemTemplate>
                        <a href="javascript:;" onclick="<%# GetEditUrl(Eval("Id"), Eval("Name")) %>">编辑</a>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
       
    </form>

    <script>

        function getNewWindowUrl() {
            return F.baseUrl + 'grid/grid_newtab_hideupdate_window.aspx?parenttabid=' + parent.getActiveTabId();
        }


        function getEditWindowUrl(id, name) {
            return F.baseUrl + 'grid/grid_newtab_hideupdate_window.aspx?id=' + id + '&name=' + name + '&parenttabid=' + parent.getActiveTabId();
        }


        function updatePage(param1) {
            __doPostBack('', 'UpdatePage$' + param1);
        }

    </script>
</body>
</html>
