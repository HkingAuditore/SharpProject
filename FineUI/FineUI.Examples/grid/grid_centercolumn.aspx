﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_centercolumn.aspx.cs"
    Inherits="FineUI.Examples.data.grid_centercolumn" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        /* 分组列的标题靠左显示 */
        #Group.x-column-header {
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格"  EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="900px"
            runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="80px" DataField="EntranceYear" HeaderText="入学年份" />
                <%--<f:CheckBoxField Width="150px" TextAlign="Center" RenderAsStaticField="true" DataField="AtSchool"
                    HeaderText="是否在校（居中）" />--%>
                <f:HyperLinkField HeaderText="所学专业（居中）" TextAlign="Center" DataToolTipField="Major"
                    DataTextField="Major" DataTextFormatString="{0}" DataNavigateUrlFields="Major"
                    DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}" UrlEncode="true"
                    Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField ColumnID="Group" Width="250px" TextAlign="Right" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组（内容靠右，标题靠左）"></f:ImageField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <br />
        <f:HiddenField ID="highlightRows" runat="server">
        </f:HiddenField>
    </form>
</body>
</html>
