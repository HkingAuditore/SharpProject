<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tabstrip_position.aspx.cs" Inherits="FineUI.Examples.tabstrip.tabstrip_position" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:TabStrip ID="TabStrip1" Width="650px" Height="150px" ShowBorder="true" TabPosition="Top" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab Title="标签一" BodyPadding="5px" Layout="Fit"
                    runat="server">
                    <Items>
                        <f:Label ID="Label1" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签二" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label2" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab Title="标签三" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label3" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip2" Width="650px" Height="150px" ShowBorder="true" TabPosition="Bottom" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab1" Title="标签一" BodyPadding="5px" Layout="Fit"
                    runat="server">
                    <Items>
                        <f:Label ID="Label4" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab2" Title="标签二" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label5" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab3" Title="标签三" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label6" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip3" Width="650px" Height="150px" ShowBorder="true" TabPosition="Left" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab4" Title="标签一" BodyPadding="5px" Layout="Fit"
                    runat="server">
                    <Items>
                        <f:Label ID="Label7" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab5" Title="标签二" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label8" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab6" Title="标签三" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label9" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
        <br />
        <f:TabStrip ID="TabStrip4" Width="650px" Height="150px" ShowBorder="true" TabPosition="Right" ActiveTabIndex="0"
            runat="server">
            <Tabs>
                <f:Tab ID="Tab7" Title="标签一" BodyPadding="5px" Layout="Fit"
                    runat="server">
                    <Items>
                        <f:Label ID="Label10" Text="第一个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab8" Title="标签二" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label11" Text="第二个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
                <f:Tab ID="Tab9" Title="标签三" BodyPadding="5px" runat="server">
                    <Items>
                        <f:Label ID="Label12" Text="第三个标签的内容" runat="server" />
                    </Items>
                </f:Tab>
            </Tabs>
        </f:TabStrip>
    </form>
</body>
</html>
