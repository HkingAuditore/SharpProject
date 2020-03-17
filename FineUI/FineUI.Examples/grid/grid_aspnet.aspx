<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_aspnet.aspx.cs" Inherits="FineUI.Examples.grid.grid_aspnet" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="Grid1" Width="800px" DataKeyNames="Id,Name" runat="server"
            AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="姓名" />
                <asp:TemplateField HeaderText="性别">
                    <ItemTemplate>
                        <%# GetGender(Eval("Gender")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EntranceYear" HeaderText="入学年份" />
                <asp:CheckBoxField DataField="AtSchool" HeaderText="是否在校" />
                <asp:HyperLinkField HeaderText="所学专业" DataTextField="Major" DataTextFormatString="{0}"
                    DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    Target="_blank" />
                <asp:ImageField DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
