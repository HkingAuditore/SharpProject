<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vbox_hbox.aspx.cs" Inherits="FineUI.Examples.layout.vbox_hbox" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" AutoSizePanelID="Panel2" />
        <f:Panel ID="Panel2" runat="server" ShowBorder="True"
            Layout="VBox" ShowHeader="True" Title="面板（改变页面大小来观察面板的变化）" BodyPadding="5">
            <Items>
                <f:Panel ID="Panel1" BoxFlex="1" runat="server"
                    ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigChildMargin="0 5 0 0" Margin="0 0 5 0">
                    <Items>
                        <f:Panel ID="Panel3" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label1" runat="server" Text="Label1">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel4" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label2" runat="server" Text="Label2">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel6" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false" Margin="0">
                            <Items>
                                <f:Label ID="Label3" runat="server" Text="Label3">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>
                <f:Panel ID="Panel5" BoxFlex="1" runat="server"
                    ShowBorder="false" ShowHeader="false" Layout="HBox" BoxConfigChildMargin="0 5 0 0">
                    <Items>
                        <f:Panel ID="Panel7" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label4" runat="server" Text="Label4">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel8" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false">
                            <Items>
                                <f:Label ID="Label5" runat="server" Text="Label5">
                                </f:Label>
                            </Items>
                        </f:Panel>
                        <f:Panel ID="Panel9" BoxFlex="1" runat="server" ShowBorder="true" ShowHeader="false" Margin="0">
                            <Items>
                                <f:Label ID="Label6" runat="server" Text="Label6">
                                </f:Label>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:Panel>

            </Items>
        </f:Panel>

    </form>
</body>
</html>
