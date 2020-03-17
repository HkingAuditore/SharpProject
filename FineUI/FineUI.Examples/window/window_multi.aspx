<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window_multi.aspx.cs" Inherits="FineUI.Examples.window.window_multi" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <table>
            <tr>
                <td>
                    <f:DropDownList runat="server" ID="DropDownList1">
                        <f:ListItem Text="窗体一" Value="1" />
                        <f:ListItem Text="窗体二" Value="2" />
                        <f:ListItem Text="窗体三" Value="3" />
                    </f:DropDownList>
                </td>
                <td>
                    <f:Button ID="btnShowWindow" Text="显示窗体" runat="server" OnClick="btnShowWindow_Click">
                    </f:Button>
                </td>
            </tr>
        </table>

        <br />
        <br />
        <f:Window ID="Window1" Width="650px" Height="300px" Icon="TagBlue" Title="窗体一" Hidden="true"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" AutoScroll="true" BodyPadding="10px">
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
                                <f:DropDownList ID="DropDownList2" runat="server" Label="下拉列表" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
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
        </f:Window>
        <f:Window ID="Window2" Width="650px" Height="300px" Icon="TagBlue" Title="窗体二" Hidden="true"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" AutoScroll="true" BodyPadding="10px">
            <Items>
                <f:Form BodyPadding="5px" ID="Form3" LabelWidth="100px" ShowBorder="false" ShowHeader="false"
                    runat="server" Title="表单 2">
                    <Rows>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:Label ID="Label2" runat="server" Label="标签" Text="标签的值">
                                </f:Label>
                                <f:CheckBox ID="CheckBox2" runat="server" Text="复选框" Label="复选框">
                                </f:CheckBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:DropDownList ID="DropDownList3" runat="server" Label="下拉列表" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                                    <f:ListItem Text="可选项1" Value="Value1" />
                                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                                    <f:ListItem Text="可选项4" Value="Value4" />
                                    <f:ListItem Text="可选项5" Value="Value5" />
                                    <f:ListItem Text="可选项6" Value="Value6" />
                                    <f:ListItem Text="可选择项7" Value="Value7" />
                                    <f:ListItem Text="可选择项8" Value="Value8" />
                                </f:DropDownList>
                                <f:TextBox ID="TextBox2" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                                    Text="">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Window>
        <f:Window ID="Window3" Width="650px" Height="300px" Icon="TagBlue" Title="窗体三" Hidden="false"
            EnableMaximize="true" EnableCollapse="true" runat="server" EnableResize="true"
            IsModal="false" AutoScroll="true" BodyPadding="10px">
            <Items>
                <f:Form BodyPadding="5px" ID="Form4" LabelWidth="100px" ShowBorder="false" ShowHeader="false"
                    runat="server" Title="表单 3">
                    <Rows>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:Label ID="Label3" runat="server" Label="标签" Text="标签的值">
                                </f:Label>
                                <f:CheckBox ID="CheckBox3" runat="server" Text="复选框" Label="复选框">
                                </f:CheckBox>
                            </Items>
                        </f:FormRow>
                        <f:FormRow ColumnWidths="50% 50%">
                            <Items>
                                <f:DropDownList ID="DropDownList4" runat="server" Label="下拉列表" Required="true" ShowRedStar="true" AutoSelectFirstItem="false">
                                    <f:ListItem Text="可选项1" Value="Value1" />
                                    <f:ListItem Text="可选项2（不可选择）" Value="Value2" EnableSelect="false" />
                                    <f:ListItem Text="可选项3（不可选择）" Value="Value3" EnableSelect="false" />
                                    <f:ListItem Text="可选项4" Value="Value4" />
                                    <f:ListItem Text="可选项5" Value="Value5" />
                                    <f:ListItem Text="可选项6" Value="Value6" />
                                    <f:ListItem Text="可选择项7" Value="Value7" />
                                    <f:ListItem Text="可选择项8" Value="Value8" />
                                </f:DropDownList>
                                <f:TextBox ID="TextBox3" ShowRedStar="true" runat="server" Label="文本框" Required="true"
                                    Text="">
                                </f:TextBox>
                            </Items>
                        </f:FormRow>
                    </Rows>
                </f:Form>
            </Items>
        </f:Window>
    </form>
</body>
</html>
