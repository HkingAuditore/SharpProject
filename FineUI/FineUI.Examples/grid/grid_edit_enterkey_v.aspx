﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_edit_enterkey_v.aspx.cs"
    Inherits="FineUI.Examples.grid.grid_edit_enterkey_v" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="true" Title="表格"  EnableCollapse="true"
            Width="900px" runat="server"
            DataKeyNames="Id,Name">
            <Columns>
                <f:TemplateField Width="60px" EnableColumnHide="false" EnableHeaderMenu="false">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                </f:TemplateField>
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
                <f:TemplateField HeaderText="语文" Width="100px">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxYuwen" CssClass="group1" runat="server" Width="80px" TabIndex="<%# Container.DataItemIndex + 10 %>" Text="<%# GetRandomNumber() %>"></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
                <f:TemplateField HeaderText="数学" Width="100px">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxShuxue" CssClass="group2" runat="server" Width="80px" TabIndex="<%# Container.DataItemIndex + 10 + GetDataSourceCount() %>" Text="<%# GetRandomNumber() %>"></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
                <f:TemplateField HeaderText="英语" Width="100px">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxYingyu" CssClass="group2" runat="server" Width="80px" TabIndex="<%# Container.DataItemIndex + 10 + GetDataSourceCount() * 2 %>" Text="<%# GetRandomNumber() %>"></asp:TextBox>
                    </ItemTemplate>
                </f:TemplateField>
            </Columns>
        </f:Grid>
        <br />
        请注意如何实现：
        <ul>
            <li>使用Tab键遍历一列当中所有的文本输入框（通过TextBox的TabIndex属性）</li>
            <li>使用Enter键遍历一列当中所有的文本输入框（JavaScript函数registerEnterEvent）</li>
            <li>Tab/Enter遍历文本框时，先遍历一列的文本框，然后再遍历下一列的文本框</li>
        </ul>
        <br />
        <f:Button runat="server" ID="Button1" OnClick="Button1_Click" CssClass="marginr" Text="获取用户输入的分组值">
        </f:Button>
        <f:Button ID="Button2" runat="server" Text="重新绑定表格" OnClick="Button2_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
        <br />
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var gridClientID = '<%= Grid1.ClientID %>';
        var inputselector = '.f-grid-tpl input';

        function registerEnterEvent() {
            var grid = F(gridClientID);
            
            $(grid.el.dom).delegate(inputselector, 'keypress', function (evt) {
                // 13 - Enter Key
                if (evt.keyCode === 13) {
                    var row = $(this).parents('.x-grid-item');
                    
                    var inputs = row.find(inputselector);
                    // 一行中有多少个输入框
                    var inputCount = inputs.length;
                    // 当前输入框在本行中的序号（用来标示那一列）
                    var inputIndex = inputs.index(this);
                    
                    // 查找下一行
                    var nextRow = row.next();
                    if (nextRow.length) {
                        // 选中下一行同列的的输入框
                        nextRow.find(inputselector).eq(inputIndex).select();
                    } else {
                        // 如果本行是最后一行，则选择下一列第一行的输入框
                        inputIndex++;
                        if (inputIndex >= inputCount) {
                            inputIndex = 0;
                        }
                        row.prevAll(':last').find(inputselector).eq(inputIndex).select();
                    }
                }
            });
        }


        F.ready(function () {
            registerEnterEvent();
        });

    </script>
</body>
</html>
