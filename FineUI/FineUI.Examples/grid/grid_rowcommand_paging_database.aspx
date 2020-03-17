<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_rowcommand_paging_database.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_rowcommand_paging_database" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格" EnableCollapse="true" ShowBorder="true" ShowHeader="true"
            runat="server" DataKeyNames="Id,Name" Width="800px"
            Height="300px" OnRowCommand="Grid1_RowCommand" EnableCheckBoxSelect="false"
            AllowPaging="true" IsDatabasePaging="true" PageSize="5" OnPageIndexChange="Grid1_PageIndexChange">
            <Columns>
                <f:RowNumberField EnablePagingNumber="true"></f:RowNumberField>
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
                    HeaderText="分组">
                </f:ImageField>
                <f:LinkButtonField HeaderText="&nbsp;" Width="80px" CommandName="Action1" Text="按钮 1" />
                <f:LinkButtonField HeaderText="&nbsp;" Width="80px" ConfirmText="你确定要这么做么？" ConfirmTarget="Top"
                    CommandName="Action2" Text="按钮 2" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
