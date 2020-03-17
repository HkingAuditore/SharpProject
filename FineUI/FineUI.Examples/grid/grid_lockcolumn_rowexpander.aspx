<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_lockcolumn_rowexpander.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_lockcolumn_rowexpander" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableCollapse="true" Width="800px" Height="350px"
            runat="server" DataKeyNames="Id,Name" AllowColumnLocking="true" EnableCheckBoxSelect="false">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" EnableLock="true" Locked="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="100px" EnableLock="true" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" EnableLock="true" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="100px" EnableLock="true" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField Width="400px" EnableLock="true" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:ImageField Width="100px" EnableLock="true" TextAlign="Right" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组"></f:ImageField>
                <f:BoundField Width="100px" EnableLock="true" DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}"
                    HeaderText="注册日期" />
                <f:TemplateField ColumnID="expander" RenderAsRowExpander="true">
                    <ItemTemplate>
                        <div class="expander">
                            <p>
                                <strong>姓名：</strong><%# Eval("Name") %>
                            </p>
                            <p>
                                <strong>简介：</strong><%# Eval("Desc") %>
                            </p>
                        </div>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="btnExpandRowExpanders" runat="server" CssClass="marginr" Text="展开全部的行扩展列" OnClick="btnExpandRowExpanders_Click">
        </f:Button>
        <f:Button ID="btnCollapseRowExpanders" runat="server" Text="折叠全部的行扩展列" OnClick="btnCollapseRowExpanders_Click">
        </f:Button>
        <br />
        
    </form>
</body>
</html>
