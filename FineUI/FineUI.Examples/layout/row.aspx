<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="row.aspx.cs" Inherits="FineUI.Examples.layout.row" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .rowpanel {
            margin-bottom: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <x:PageManager ID="PageManager1" runat="server" />
        <x:Panel ID="Panel2" runat="server" Height="350px" Width="550px" ShowBorder="True" EnableFrame="true" EnableCollapse="true"
            BodyPadding="5px" Layout="Row" ShowHeader="True"
            Title="面板（Height=350px Width=550px Layout=Row）">
            <Items>
                <x:Panel ID="Panel1" Height="50px" Width="200px" runat="server"
                    BodyPadding="5px" ShowBorder="True" ShowHeader="true">
                    <Items>
                        <x:Label ID="Label3" Text="Height=50px Width=200px" runat="server">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel4" RowHeight="30%" runat="server"
                    BodyPadding="5px" ShowBorder="True" ShowHeader="true">
                    <Items>
                        <x:Label ID="Label4" Text="RowHeight=30%" runat="server">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel3" RowHeight="70%" runat="server"
                    BodyPadding="5px" ShowBorder="True" ShowHeader="true">
                    <Items>
                        <x:Label ID="Label5" Text="RowHeight=70%" runat="server">
                        </x:Label>
                    </Items>
                </x:Panel>
            </Items>
        </x:Panel>
        <br />
        <x:Panel ID="Panel5" runat="server" Height="350px" Width="550px" ShowBorder="True" EnableFrame="true" EnableCollapse="true"
            BodyPadding="5px" Layout="Row" ShowHeader="True"
            Title="面板（Height=350px Width=550px Layout=Row）">
            <Items>
                <x:Panel ID="Panel6" Height="50px" Width="200px" CssClass="rowpanel"
                    runat="server" BodyPadding="5px" ShowBorder="True" ShowHeader="true">
                    <Items>
                        <x:Label ID="Label1" Text="Height=50px Width=200px" runat="server">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel7" RowHeight="30%" CssClass="rowpanel"
                    runat="server" BodyPadding="5px" ShowBorder="True" ShowHeader="true">
                    <Items>
                        <x:Label ID="Label2" Text="RowHeight=30%" runat="server">
                        </x:Label>
                    </Items>
                </x:Panel>
                <x:Panel ID="Panel8" RowHeight="70%" runat="server"
                    BodyPadding="5px" ShowBorder="True" ShowHeader="true">
                    <Items>
                        <x:Label ID="Label6" Text="RowHeight=70%" runat="server">
                        </x:Label>
                    </Items>
                </x:Panel>
            </Items>
        </x:Panel>
    </form>
</body>
</html>
