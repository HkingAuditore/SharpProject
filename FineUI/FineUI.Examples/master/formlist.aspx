<%@ Page Title="" Language="C#" MasterPageFile="~/master/SingleGrid.Master" AutoEventWireup="true" CodeBehind="formlist.aspx.cs" Inherits="FineUI.Examples.master.formlist" %>

<%@ MasterType VirtualPath="~/master/SingleGrid.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainCPH" runat="server">
    <f:Form ID="Form6" ShowBorder="false" ShowHeader="false" runat="server">
        <Rows>
            <f:FormRow>
                <Items>
                    <f:TwinTriggerBox runat="server" EmptyText="在用户名中搜索" ShowLabel="false" ID="ttbSearch"
                        ShowTrigger1="false" OnTrigger1Click="ttbSearch_Trigger1Click" OnTrigger2Click="ttbSearch_Trigger2Click"
                        Trigger1Icon="Clear" Trigger2Icon="Search">
                    </f:TwinTriggerBox>
                    <f:DropDownList ID="DropDownList1" ShowLabel="false" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                        runat="server">
                        <f:ListItem Text="过滤条件一" Value="filter1" />
                        <f:ListItem Text="过滤条件二" Value="filter2" />
                        <f:ListItem Text="过滤条件三" Value="filter3" />
                    </f:DropDownList>
                </Items>
            </f:FormRow>
        </Rows>
    </f:Form>
    <f:Grid ID="Grid1" EnableCollapse="false" PageSize="5" ShowBorder="true" ShowHeader="false"
        BoxFlex="1"
        AllowPaging="true" runat="server" EnableCheckBoxSelect="True"
        DataKeyNames="Id,Name" IsDatabasePaging="true"
        AllowSorting="true" SortField="Name" SortDirection="ASC">
        <Columns>
            <f:RowNumberField />
            <f:BoundField Width="100px" DataField="Name" SortField="Name" DataFormatString="{0}"
                HeaderText="姓名" />
            <f:TemplateField Width="80px" SortField="Gender" HeaderText="性别">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# GetGender(Eval("Gender")) %>'></asp:Label>
                </ItemTemplate>
            </f:TemplateField>
            <f:BoundField Width="80px" SortField="EntranceYear" DataField="EntranceYear" HeaderText="入学年份" />
            <f:CheckBoxField Width="80px" SortField="AtSchool" RenderAsStaticField="true" DataField="AtSchool"
                HeaderText="是否在校" />
            <f:HyperLinkField HeaderText="所学专业" DataToolTipField="Major" DataTextField="Major"
                DataTextFormatString="{0}" DataNavigateUrlFields="Major" DataNavigateUrlFormatString="http://gsa.ustc.edu.cn/search?q={0}"
                UrlEncode="true" Target="_blank" ExpandUnusedSpace="True" />
            <f:ImageField Width="80px" DataImageUrlField="Group" DataImageUrlFormatString="~/res/images/16/{0}.png"
                HeaderText="分组"></f:ImageField>
        </Columns>
        <Toolbars>
            <f:Toolbar ID="Toolbar1" runat="server">
                <Items>
                    <f:Button ID="btnImport" runat="server" Text="导入数据" OnClick="btnImport_Click"></f:Button>
                    <f:Button ID="btnExport" runat="server" Text="导出数据" OnClick="btnExport_Click"></f:Button>
                </Items>
            </f:Toolbar>
        </Toolbars>
    </f:Grid>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="headCPH">
    <meta name="sourcefiles" content="~/master/SingleGrid.Master;~/master/ISingleGridPage.cs" />
</asp:Content>
