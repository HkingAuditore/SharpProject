<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_formgrid.aspx.cs" Inherits="FineUI.Examples.iframe.vbox_formgrid" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/grid/grid_iframe_window.aspx" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel7" runat="server" />
        <f:Panel ID="Panel7" runat="server" Margin="5px" BodyPadding="5px" AutoScroll="true"
            Title="面板（Layout=VBox BodyPadding=5 AutoScroll=true），高度变小时可能出现纵向滚动条" ShowBorder="true" ShowHeader="True" Layout="VBox">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server">
                    <Items>
                        <f:Button ID="Button1" Text="测试按钮" runat="server">
                        </f:Button>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="Button2" Text="测试按钮" runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
            <Items>
                <f:Form ID="Form5" ShowBorder="true" ShowHeader="true" Title="表单" BodyPadding="5 5 0 5" runat="server">
                    <Rows>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox1" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox2" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox3" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox4" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox5" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox6" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox7" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox8" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox9" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox10" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox11" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox12" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox13" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox14" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox15" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox16" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox17" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox18" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox19" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox20" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow>
                            <Items>
                                <f:TextBox ID="TextBox21" runat="server" Label="Label" Text=""></f:TextBox>
                                <f:TextBox ID="TextBox22" runat="server" Label="Label" Text=""></f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
                <f:Grid ID="Grid2" Title="表格（BoxFlex=1 MinHeight=300）" PageSize="80" ShowBorder="true" AllowPaging="true" IsDatabasePaging="false"
                    OnPageIndexChange="Grid2_PageIndexChange" ShowHeader="true" runat="server" EnableCheckBoxSelect="True"
                    DataKeyNames="Id,Name" BoxFlex="1" MinHeight="300px">
                    <Toolbars>
                        <f:Toolbar ID="Toolbar2" runat="server">
                            <Items>
                                <f:Button ID="btnPopupWindow" Text="测试按钮" runat="server">
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                                </f:ToolbarSeparator>
                                <f:Button ID="btnCheckSelection" Text="测试按钮" runat="server">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
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
                            HeaderText="分组">
                        </f:ImageField>
                    </Columns>
                </f:Grid>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
