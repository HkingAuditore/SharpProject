<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_form.aspx.cs" Inherits="FineUI.Examples.layout.hbox_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        /* 开源版用不到这个自定义 CSS */
        .mysimpleform .f-field {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel1" runat="server" Width="850px" Height="350px" ShowBorder="True" EnableCollapse="true"
            Layout="VBox" BodyPadding="5px" BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（SimpleForm - Layout=HBox）">
            <Items>
                <f:SimpleForm ID="SimpleForm1" CssClass="mysimpleform" runat="server" ShowBorder="false" EnableCollapse="true"
                    Layout="HBox" ShowHeader="false">
                    <Items>
                        <f:Label runat="server" Text="销毁统计时间段："></f:Label>
                        <f:DatePicker runat="server" CssClass="marginr" Width="150px" Required="true" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期"
                            ShowLabel="false" Label="销毁统计开始时间"
                            ID="dpStartDate" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="dpEndDate" CssClass="marginr" Width="150px" Required="true" Readonly="false"
                            CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期"
                            ShowLabel="false" Label="销毁统计结束时间"
                            runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="btnClearDate" CssClass="marginr" Text="重置起止时间" EnablePostBack="false">
                            <Listeners>
                                <f:Listener Event="click" Handler="onClearDateClick" />
                            </Listeners>
                        </f:Button>
                        <f:Button runat="server" ID="btnSearch" Text="查询" ValidateForms="SimpleForm1"></f:Button>
                    </Items>
                </f:SimpleForm>
                <f:Panel ID="Panel3" BoxFlex="1" Margin="0" ShowBorder="true" ShowHeader="false" runat="server">
                    <Items>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

        <br />
        <br />
        <br />
        下面使用 Column 布局实现相同的效果：
        <br />
        <f:Panel ID="Panel2" runat="server" Width="850px" Height="350px" ShowBorder="True" EnableCollapse="true"
            Layout="VBox" BodyPadding="5px" BoxConfigChildMargin="0 0 5 0" ShowHeader="true" Title="面板（SimpleForm - Layout=Column）">
            <Items>
                <f:SimpleForm ID="SimpleForm2" CssClass="mysimpleform" runat="server" ShowBorder="false" EnableCollapse="true"
                    Layout="Column" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label1" runat="server" Text="销毁统计时间段："></f:Label>
                        <f:DatePicker runat="server" Width="150px" CssClass="marginr" Required="true" DateFormatString="yyyy-MM-dd" EmptyText="请选择开始日期"
                            ShowLabel="false" Label="销毁统计开始时间"
                            ID="DatePicker1" EnableEdit="false">
                        </f:DatePicker>
                        <f:DatePicker ID="DatePicker2" Width="150px" CssClass="marginr" Required="true" Readonly="false"
                            CompareControl="dpStartDate" DateFormatString="yyyy-MM-dd" CompareOperator="GreaterThan" CompareMessage="结束日期应该大于开始日期" EmptyText="请选择结束日期"
                            ShowLabel="false" Label="销毁统计结束时间"
                            runat="server" EnableEdit="false">
                        </f:DatePicker>
                        <f:Button runat="server" ID="Button1" CssClass="marginr" Text="重置起止时间" EnablePostBack="false">
                            <Listeners>
                                <f:Listener Event="click" Handler="onClearDateClick" />
                            </Listeners>
                        </f:Button>
                        <f:Button runat="server" ID="Button2" Text="查询" ValidateForms="SimpleForm2"></f:Button>
                    </Items>
                </f:SimpleForm>
                <f:Panel BoxFlex="1" Margin="0" ShowBorder="true" ShowHeader="false" runat="server">
                    <Items>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
    </form>

    <script>

        function onClearDateClick(event) {
            // this -> 按钮实例；获取按钮所在的表单ID
            var formId = this.el.findParent('.mysimpleform').getAttribute('id');

            F(formId).f_reset();
        }

    </script>
</body>
</html>
