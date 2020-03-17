<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hbox_autoheight_multilevels.aspx.cs" Inherits="FineUI.Examples.layout.hbox_autoheight_multilevels" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel ID="Panel5" runat="server" Width="850px" ShowBorder="True" EnableCollapse="true"
            Layout="HBox" AutoScroll="true" BodyPadding="5"
            ShowHeader="True" Title="面板（Layout=HBox BodyPadding=5 AutoScroll=true）">
            <Items>
                <f:Panel ID="Panel1" Title="面板1" BoxFlex="1" runat="server" Margin="0 5 0 0"
                    BodyPadding="5px" ShowBorder="true" ShowHeader="false" Layout="VBox">
                    <Items>
                        <f:TextBox runat="server" Label="姓名" ShowRedStar="true" Required="true"></f:TextBox>
                        <f:DropDownList Label="性别" ShowRedStar="true" Required="true" runat="server">
                            <f:ListItem Text="男" Value="男" Selected="true" />
                            <f:ListItem Text="女" Value="女" />
                        </f:DropDownList>
                        <f:TextArea Label="个人简介" CssStyle="margin-bottom:0;" runat="server" BoxFlex="1"></f:TextArea>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel2" Title="面板2" BoxFlex="1"
                    runat="server" BodyPadding="5px" ShowBorder="true" ShowHeader="false">
                    <Items>
                        <f:Label ID="Label3" runat="server" EncodeText="false" Text="BoxFlex=1<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>bottom line">
                        </f:Label>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>

    </form>
</body>
</html>
