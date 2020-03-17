<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn.aspx.cs" Inherits="FineUI.Examples.grid.grid_lockcolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" Width="800px" runat="server"
            AllowColumnLocking="true" EnableCollapse="true"
            DataKeyNames="Guid">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" EnableLock="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="100px" EnableLock="true" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="100px" EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField ExpandUnusedSpace="true" HeaderText="所学专业" EnableLock="true" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:ImageField Width="100px" EnableLock="true" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组"></f:ImageField>
                <f:BoundField Width="100px" EnableLock="true" DataField="LogTime" DataFormatString="{0:yy-MM-dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：本示例中“所学专业”是自动扩展列，所以初始右侧没有横向滚动条，可以尝试改变列宽度使其出现横向滚动条。
    </form>
</body>
</html>
