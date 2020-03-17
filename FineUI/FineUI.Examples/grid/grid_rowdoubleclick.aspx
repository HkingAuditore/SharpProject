<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowdoubleclick.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_rowdoubleclick" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:Grid ID="Grid1" Title="表格"  EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="800px"
        runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name"
        EnableRowDoubleClickEvent="true" OnRowDoubleClick="Grid1_RowDoubleClick">
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
        </Columns>
    </f:Grid>
    <br />
    </form>
</body>
</html>
