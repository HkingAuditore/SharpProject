<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_line_wrap.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_line_wrap" %>

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
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="true" Width="900px" Height="400px"
            runat="server" DataKeyNames="Guid">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField Width="120px" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:BoundField ExpandUnusedSpace="true" DataField="Desc" HtmlEncode="false" HeaderText="个人简介" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        注：
        <ul>
            <li>
                ExtJS v6.2 遇到行高不同时会在下方出现空白，属于已知问题，暂时没有解决办法。
            </li>
            <li>
                参考：<a href="https://www.sencha.com/forum/showthread.php?329718-extjs-6-0-2-grid-rows-with-variable-height">https://www.sencha.com/forum/showthread.php?329718-extjs-6-0-2-grid-rows-with-variable-height</a>
            </li>
        </ul>
    </form>
</body>
</html>
