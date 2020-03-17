﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_paging_selection.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_paging_selection" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格（跨页选中行）" EnableCollapse="true" PageSize="5" ShowBorder="true" ShowHeader="true"
            AllowPaging="true" IsDatabasePaging="false" runat="server" EnableCheckBoxSelect="True" Width="800px" DataKeyNames="Id,Name"
            OnPageIndexChange="Grid1_PageIndexChange" KeepCurrentSelection="true"
            DataIDField="Id" ClearSelectionsBeforePaging="false">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="100px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="100px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </f:ImageField>
            </Columns>
        </f:Grid>
        <f:HiddenField ID="hfSelectedIDS" runat="server"></f:HiddenField>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中行的ID列表" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        <strong>出于性能考虑，请在实际项目中使用数据库分页（不要使用内存分页）！</strong>
    </form>
</body>
</html>
