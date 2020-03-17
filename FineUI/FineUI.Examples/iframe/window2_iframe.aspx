﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="window2_iframe.aspx.cs"
    Inherits="FineUI.Examples.iframe.window2_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .steps {
            border: solid 1px red;
            margin: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" EnableFormChangeConfirm="true"
            ValidateForms="SimpleForm1" ValidateTarget="Top" OnCustomEvent="PageManager1_CustomEvent" runat="server" />
        <f:Panel ID="Panel1" ShowBorder="false" ShowHeader="false" Layout="Fit" BodyPadding="5px"
            runat="server">
            <Items>
                <f:SimpleForm ID="SimpleForm1" ShowBorder="false"
                    ShowHeader="false" AutoScroll="true" BodyPadding="5px" runat="server" EnableCollapse="True">
                    <Items>
                        <f:Label ID="Label2" EncodeText="false" CssClass="steps" ShowEmptyLabel="false" Text="按照如下步骤操作来观察“确认关闭”对话框：<ul><li>编辑本表单（比如选中复选框、修改日期）</li><li>点击弹出窗体右上角关闭图标、关闭按钮、当前选项卡关闭图标、浏览器的关闭按钮或者浏览器的刷新图标，<a target='_blank' href='../res/images/formchangeconfirm.png'>查看图示</a></li><li>弹出确认关闭窗体的对话框</li></ul>" runat="server" />
                        <f:NumberBox ID="NumberBox1" Label="数字输入框" Required="true" ShowRedStar="true" runat="server" />
                        <f:CheckBox ID="CheckBox1" runat="server" Label="复选框">
                        </f:CheckBox>
                        <f:TextBox ID="TextBox1" Label="文本输入框" runat="server" ShowRedStar="true" Required="True">
                        </f:TextBox>
                        <f:DatePicker ID="DatePicker1" runat="server" SelectedDate="2008-05-09" Label="日期选择器"
                            Text="2008-05-09">
                        </f:DatePicker>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Panel>
    </form>
</body>
</html>
