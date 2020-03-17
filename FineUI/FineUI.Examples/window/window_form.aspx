<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_form.aspx.cs"
    Inherits="FineUI.Examples.window.window_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体" Hidden="false"
            EnableMaximize="true"
            EnableCollapse="true" runat="server" EnableResize="true" BodyPadding="5px" Layout="Fit"
            IsModal="false">
            <Items>
                <f:Form BodyPadding="5px" ID="Form2" LabelWidth="100px" ShowBorder="false" ShowHeader="false"
                    runat="server" Title="表单 1">
                    <Rows>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:Label ID="Label1" runat="server" Label="标签" Text="标签的值">
                                </f:Label>
                                <f:CheckBox ID="CheckBox1" runat="server" Text="复选框" Label="复选框">
                                </f:CheckBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:DropDownList ID="DropDownList1" runat="server" Label="下拉列表" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                                    <f:ListItem Text="可选项1" Value="Value1" />
                                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                                    <f:ListItem Text="可选项4" Value="Value4" />
                                    <f:ListItem Text="可选项5" Value="Value5" />
                                    <f:ListItem Text="可选项6" Value="Value6" />
                                    <f:ListItem Text="可选择项7" Value="Value7" />
                                    <f:ListItem Text="可选择项8" Value="Value8" />
                                </f:DropDownList>
                                <f:TextBox ID="TextBox1" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                                    Text="">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar3" Position="Top" runat="server">
                    <Items>
                        <f:ToolbarText Text="工具条文本一" ID="ToolbarText3" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                        </f:ToolbarSeparator>
                        <f:ToolbarText Text="工具条文本二" ID="ToolbarText4" runat="server">
                        </f:ToolbarText>
                        <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server">
                        </f:ToolbarSeparator>
                        <f:Button ID="Button1" runat="server" EnablePostBack="false" Text="工具栏按钮">
                        </f:Button>
                    </Items>
                </f:Toolbar>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <f:Button runat="server" Text="验证此表单并提交" ValidateForms="Form2"
                            ID="btnSubmitForm1" OnClick="btnSubmitForm1_Click">
                        </f:Button>
                        <f:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="关闭窗体">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
    </form>

</body>
</html>
