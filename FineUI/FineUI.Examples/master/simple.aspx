<%@ Page Title="" Language="C#" MasterPageFile="~/master/Simple.Master" AutoEventWireup="true" CodeBehind="simple.aspx.cs" Inherits="FineUI.Examples.master.simple" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCPH" runat="server">
    <meta name="sourcefiles" content="~/master/Simple.Master" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCPH" runat="server">
    <f:Panel ID="Panel1" Title="位于内容页中" BoxFlex="1" Margin="0" runat="server"
        BodyPadding="5px" ShowBorder="true" ShowHeader="true">
        <Items>
            <f:Label ID="labResult" runat="server" Text="请点击左侧树节点">
            </f:Label>
        </Items>
    </f:Panel>
</asp:Content>
