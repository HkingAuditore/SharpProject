<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_style_columnclass.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_style_columnclass" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style type="text/css">
        .x-grid-item .x-grid-cell-bfEntranceYear {
            background-color: #0094ff;
            color: #fff;
        }

        .x-grid-item .x-grid-cell-hlfMajor {
            background-color: #b200ff;
            color: #fff;
        }

        .x-grid-item .x-grid-cell-hlfMajor a,
        .x-grid-item .x-grid-cell-hlfMajor a:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" Title="表格" EnableCollapse="true" ShowBorder="true" ShowHeader="true" Width="800px"
            runat="server" EnableCheckBoxSelect="true" DataKeyNames="Id,Name">
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
                <f:BoundField Width="80px" ColumnID="bfEntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
                <f:CheckBoxField Width="80px" RenderAsStaticField="true" DataField="AtSchool" HeaderText="是否在校" />
                <f:HyperLinkField HeaderText="所学专业" ColumnID="hlfMajor" DataToolTipField="Major" DataTextField="Major"
                    DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                    UrlEncode="true" Target="_blank" ExpandUnusedSpace="True" />
                <f:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                    HeaderText="分组">
                </f:ImageField>
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" CssClass="marginr" Text="选中了哪些行" OnClick="Button2_Click">
        </f:Button>
        <f:Button ID="Button1" runat="server" Text="重新绑定表格" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
