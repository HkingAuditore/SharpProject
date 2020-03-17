<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowexpander_expandall2.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_rowexpander_expandall2" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .x-grid-row-body .expander
        {
            padding: 5px;
        }
        .x-grid-row-body .expander p
        {
            padding: 5px;
        }
        .x-grid-row-body .expander strong
        {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <x:PageManager ID="PageManager1" runat="server" />
    <x:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" EnableFrame="true" EnableCollapse="true" Width="800px" Height="450px"
        runat="server" DataKeyNames="Id,Name" ExpandAllRowExpanders="true">
        <Columns>
            <x:TemplateField RenderAsRowExpander="true">
                <ItemTemplate>
                    <div class="expander">
                        <p>
                            <strong>姓名：</strong><%# Eval("Name") %></p>
                        <p>
                            <strong>简介：</strong><%# Eval("Desc") %></p>
                    </div>
                </ItemTemplate>
            </x:TemplateField>
            <x:RowNumberField />
            <x:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
            <x:TemplateField Width="80px" HeaderText="性别">
                <ItemTemplate>
                    <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                    <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                </ItemTemplate>
            </x:TemplateField>
            <x:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
            <x:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
            <x:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                DataNavigateUrlFieldsEncode="true" Target="_blank" ExpandUnusedSpace="True" />
            <x:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/images/16/{0}.png"
                HeaderText="分组"></x:ImageField>
            <x:BoundField Width="100px" DataField="LogTime" DataFormatString="{0:yyyy-MM-dd}" HeaderText="注册日期" />
        </Columns>
    </x:Grid>
    <br />
    <x:Button ID="Button1" runat="server" Text="重新绑定表格" CssClass="inline" OnClick="Button1_Click">
    </x:Button>
    <x:Button ID="btnExpandRowExpanders" runat="server" CssClass="inline" Text="展开全部的行扩展列" OnClick="btnExpandRowExpanders_Click">
    </x:Button>
    <x:Button ID="btnCollapseRowExpanders" runat="server" Text="折叠全部的行扩展列" OnClick="btnCollapseRowExpanders_Click">
    </x:Button>
    <br />
    <br />
    注：通过一个简单的属性，来控制是否展开所有行扩展列（即使在重新绑定数据后，依然能够保持所有扩展列的展开状态）。
    <br />
    </form>
</body>
</html>
