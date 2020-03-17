<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form.aspx.cs" Inherits="FineUI.Examples.toolbar.form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>

        .thisform {
            position: absolute;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" FormMessageTarget="Qtip" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格" Width="800px" Height="450px" runat="server" EnableCollapse="true"
            DataKeyNames="Id">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" ToolbarAlign="Left">
                    <Items>
                        <f:Form BodyPadding="5px" ID="Form2" LabelWidth="100px" EnableCollapse="true"
                            runat="server" Title="表单">
                            <Rows>
                                <f:FormRow ColumnWidths="40% 60%">
                                    <Items>
                                        <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                                        </f:Label>
                                        <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                                        </f:CheckBox>
                                    </Items>
                                </f:FormRow>
                                <f:FormRow ColumnWidths="40% 60%">
                                    <Items>
                                        <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="True" AutoSelectFirstItem="false">
                                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                                        </f:DropDownList>
                                        <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                                            Text="">
                                        </f:TextBox>
                                    </Items>
                                </f:FormRow>
                            </Rows>
                        </f:Form>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Columns>
                <f:RowNumberField />
                <f:BoundField Width="100px" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
                <f:TemplateField Width="80px" HeaderText="性别">
                    <ItemTemplate>
                        <%-- Container.DataItem 的类型是 System.Data.DataRowView 或者用户自定义类型 --%>
                        <%--<asp:Label ID="Label2" runat="server" Text='<%# GetGender(DataBinder.Eval(Container.DataItem, "Gender")) %>'></asp:Label>--%>
                        <asp:Label ID="Label3" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
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
                <f:BoundField Width="100px" DataField="LogTime" DataFormatString="{0:yy-MM-dd}" HeaderText="注册日期" />
            </Columns>
        </f:Grid>
        <br />
        <br />
        <f:Form CssClass="thisform" BodyPadding="5px" ID="Form3" LabelWidth="100px" EnableCollapse="true"
            runat="server" Title="表单">
            <Rows>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:Label ID="Label2" runat="server" Label="标签" Text="标签的值">
                        </f:Label>
                        <f:CheckBox ID="CheckBox2" runat="server" Text="复选框" Label="复选框">
                        </f:CheckBox>
                    </Items>
                </f:FormRow>
                <f:FormRow ColumnWidths="40% 60%">
                    <Items>
                        <f:DropDownList ID="DropDownList2" runat="server" Label="下拉列表" EmptyText="请选择一项" Required="true" ShowRedStar="True" AutoSelectFirstItem="false">
                            <f:ListItem Text="可选项 1" Value="0"></f:ListItem>
                            <f:ListItem Text="可选项 2" Value="1"></f:ListItem>
                        </f:DropDownList>
                        <f:TextBox ID="TextBox2" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                            Text="">
                        </f:TextBox>
                    </Items>
                </f:FormRow>
            </Rows>
        </f:Form>
    </form>
</body>
</html>
