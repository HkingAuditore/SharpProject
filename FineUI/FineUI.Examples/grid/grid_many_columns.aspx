<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_many_columns.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_many_columns" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .x-grid-item .x-grid-cell-inner {
            white-space: normal;
            word-break: break-all;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Grid1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格（23列，36行）" EnableCollapse="false" runat="server" DataKeyNames="Id">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="80px" DataField="ID" HeaderText="标识" />
                <f:BoundField Width="100px" DataField="Name" HeaderText="姓名" />
                <f:TemplateField Width="100px" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="100px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField Width="150px" HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" />
                <f:BoundField Width="500px" DataField="Desc" HtmlEncode="false" HeaderText="个人简介" />
                <f:ImageField Width="100px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </f:ImageField>
                <f:BoundField Width="300px" DataField="GUID" HeaderText="GUID" />
                <f:TemplateField Width="200px" HeaderText="爱好">
                    <ItemTemplate>
                        <%# GetHobby(Eval("Hobby")) %>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="100px" DataField="EntranceDate" HeaderText="入学时间" />
                <f:BoundField Width="100px" DataField="ChineseScore" HeaderText="语文成绩" />
                <f:BoundField Width="100px" DataField="MathScore" HeaderText="数学成绩" />
                <f:BoundField Width="100px" DataField="TotalScore" HeaderText="总成绩" />
                <f:BoundField Width="100px" DataField="ShenGao" HeaderText="身高" />
                <f:BoundField Width="100px" DataField="TiZhong" HeaderText="体重" />
                <f:BoundField Width="100px" DataField="XueYaDi" HeaderText="血压（低）" />
                <f:BoundField Width="100px" DataField="XueYaGao" HeaderText="血压（高）" />
                <f:BoundField Width="100px" DataField="ShiLiZuo" HeaderText="视力（左）" />
                <f:BoundField Width="100px" DataField="ShiLiYou" HeaderText="视力（右）" />
                <f:BoundField Width="120px" DataField="ShiLiZuoJiaoZhen" HeaderText="矫正视力（左）" />
                <f:BoundField Width="120px" DataField="ShiLiYouJiaoZhen" HeaderText="矫正视力（右）" />
            </Columns>
        </f:Grid>
    </form>
</body>
</html>
