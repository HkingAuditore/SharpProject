<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FullCalculator.aspx.cs" Inherits="WebSharp.FullCalculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
<form id="form2" runat="server">
    <f:PageManager ID="PageManager1" runat="server"/>
    <f:Panel ID="Panel1" Title="方程求解" runat="server" Height="230px" EnableCollapse="true"
             Width="650px" ShowBorder="True"
             BoxFlex="2" Margin="0 5 0 0"
             BodyPadding="5px" Layout="VBox"
             ShowHeader="True">
        <Items>
            <f:Form ID="Form3" runat="server" ShowBorder="True" BodyPadding="1px" ShowHeader="false" Title="表单" CssClass="formitem">
                <Rows>
                    <f:FormRow Width="150px">
                        <Items>
                            <f:Button ID="Button1" runat="server" Text="1" OnClick="Text_OnClick"/>
                            <f:Button ID="Button2" runat="server" Text="2" OnClick="Text_OnClick"/>
                            <f:Button ID="Button3" runat="server" Text="3" OnClick="Text_OnClick"/>
                            <f:Button ID="ButtonP" runat="server" Text="+" OnClick="Text_OnClick"/>
                        </Items>
                    </f:FormRow>
                </Rows>
                <Rows>
                    <f:FormRow Width="150px">
                        <Items>
                            <f:Button ID="Button4" runat="server" Text="4" OnClick="Text_OnClick"/>
                            <f:Button ID="Button5" runat="server" Text="5" OnClick="Text_OnClick"/>
                            <f:Button ID="Button6" runat="server" Text="6" OnClick="Text_OnClick"/>
                            <f:Button ID="ButtonMi" runat="server" Text="-" OnClick="Text_OnClick"/>
                        </Items>
                    </f:FormRow>
                </Rows>
                <Rows>
                    <f:FormRow Width="150px">
                        <Items>
                            <f:Button ID="Button7" runat="server" Text="7" OnClick="Text_OnClick"/>
                            <f:Button ID="Button8" runat="server" Text="8" OnClick="Text_OnClick"/>
                            <f:Button ID="Button9" runat="server" Text="9" OnClick="Text_OnClick"/>
                            <f:Button ID="ButtonMu" runat="server" Text="*" OnClick="Text_OnClick"/>
                        </Items>
                    </f:FormRow>
                </Rows>
                <Rows>
                    <f:FormRow Width="100px">
                        <Items>
                            <f:Button ID="Button0" runat="server" Text="0" OnClick="Text_OnClick"/>
                            <f:Button ID="ButtonE" runat="server" Text="=" OnClick="ButtonE_OnClick"/>
                            <f:Button ID="ButtonD" runat="server" Text="/" OnClick="Text_OnClick" Height="26px"/>
                        </Items>
                    </f:FormRow>
                </Rows>
                <Rows>
                    <f:FormRow Width="200px">
                        <Items>
                            <f:Button ID="ButtonL" runat="server" Text="(" OnClick="Text_OnClick"/>
                            <f:Button ID="ButtonR" runat="server" Text=")" OnClick="Text_OnClick"/>
                            <f:Button ID="ButtonReset" runat="server" Text="Reset" Width="60px" OnClick="ButtonReset_OnClick"/>
                        </Items>
                    </f:FormRow>
                </Rows>
                <Rows>
                    <f:FormRow Width="200px">
                        <Items>
                            <f:TextBox ID="Input" Label="算式" runat="server"/>
                        </Items>
                    </f:FormRow>
                    <f:FormRow Width="800px">
                        <Items>
                            <f:Label ID="Result" ShowLabel="true" Label="结果：" Text=" " runat="server">
                            </f:Label>
                        </Items>
                    </f:FormRow>
                </Rows>
            </f:Form>
        </Items>
    </f:Panel>
</form>
</body>
</html>