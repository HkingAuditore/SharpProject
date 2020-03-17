<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_dblclick_download.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_excel_dblclick_download" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格" EnableCollapse="true" ShowBorder="true" ShowHeader="true"
            runat="server" EnableCheckBoxSelect="True" DataKeyNames="Id,Name"
            Width="800px" OnRowCommand="Grid1_RowCommand">
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
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true"
                    Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组"></f:ImageField>
                <f:LinkButtonField Width="80px" CommandName="Action1" Text="按钮" />
            </Columns>
            <Listeners>
                <f:Listener Event="itemdblclick" Handler="onGridRowDblclick" />
            </Listeners>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>

    <script>
        
        // 专业版中行双击事件名是：rowdblclick，开源版是：itemdblclick
        function onGridRowDblclick(view, record) {
            // 第一个参数 false 用来指定当前不是AJAX请求
            __doPostBack(false, '', 'GridRowDblclick$' + record.getId());
        }

    </script>
</body>
</html>