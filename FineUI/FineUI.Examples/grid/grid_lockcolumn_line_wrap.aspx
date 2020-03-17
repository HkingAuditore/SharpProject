<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_line_wrap.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_lockcolumn_line_wrap" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .x-grid-item .x-grid-cell-inner {
            white-space: normal;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="true"
            Width="900px" Height="400px" AllowColumnLocking="true"
            runat="server" DataKeyNames="Guid">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" EnableLock="true" Locked="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="100px" EnableLock="true" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="100px" EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField Width="120px" EnableLock="true" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:BoundField Width="400px" EnableLock="true" DataField="Desc" HtmlEncode="false" HeaderText="个人简介" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：ExtJS在列锁定和行高不固定的情况下存在BUG。
    </form>
</body>
</html>
