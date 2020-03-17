<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_width_forcefit_minwidth.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_width_forcefit_minwidth" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格（ForceFit=true，各列宽度自适应）(改变页面大小来观察每列宽度的变化)（注意对比[性别]和[姓名]列的区别）"
            ForceFit="true" runat="server" DataKeyNames="Id" Margin="5px">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" MinWidth="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="100px" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="100px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField Width="300px" MinWidth="100px" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:BoundField Width="600px" MinWidth="100px" DataField="Desc" HtmlEncode="false" DataToolTipField="Desc" HeaderText="个人简介" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        
    </form>
</body>
</html>
