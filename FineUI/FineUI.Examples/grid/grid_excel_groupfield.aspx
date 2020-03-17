<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_excel_groupfield.aspx.cs" Inherits="FineUI.Examples.data.grid_excel_groupfield" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格" EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="800px"
            runat="server" DataKeyNames="Id,Name">
            <Columns>
                <f:TemplateField ColumnID="tfNumber" Width="60px">
                    <ItemTemplate>
                        <span id="spanNumber" runat="server"><%# Container.DataItemIndex + 1 %></span>
                    </ItemTemplate>
                </f:TemplateField>
                <f:GroupField EnableLock="true" HeaderText="分组一" TextAlign="Center">
                    <Columns>
                        <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                        <f:TemplateField ColumnID="tfGender" Width="80px" HeaderText="性别" TextAlign="Center">
                            <ItemTemplate>
                                <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                                <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                                <asp:Label ID="labGender" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                            </ItemTemplate>
                        </f:TemplateField>
                        <f:GroupField EnableLock="true" HeaderText="考试成绩" TextAlign="Center">
                            <Columns>
                                <f:BoundField EnableLock="true" Width="80px" DataField="ChineseScore" SortField="ChineseScore" HeaderText="语文成绩"
                                    TextAlign="Center" />
                                <f:BoundField EnableLock="true" Width="80px" DataField="MathScore" SortField="MathScore" HeaderText="数学成绩"
                                    TextAlign="Center" />
                                <f:BoundField EnableLock="true" Width="80px" DataField="TotalScore" SortField="TotalScore" HeaderText="总成绩"
                                    TextAlign="Center" />
                            </Columns>
                        </f:GroupField>
                    </Columns>
                </f:GroupField>
                <f:BoundField ExpandUnusedSpace="True" DataField="Major" HeaderText="所学专业" />
                <f:BoundField Width="100px" DataField="LogTime" DataFormatString="{0:yy-MM-dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button2" CssClass="marginr" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" EnableAjax="false" DisableControlBeforePostBack="false"
            runat="server" Text="导出为Excel文件" OnClick="Button1_Click">
        </f:Button>
        <br />
        <br />
        <br />
    </form>
</body>
</html>
