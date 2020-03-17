<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="passvalue_iframe_iframe.aspx.cs"
    Inherits="FineUI.Examples.iframe.passvalue_iframe_iframe" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="SimpleForm1" runat="server"></f:PageManager>
        <f:SimpleForm ID="SimpleForm1" LabelAlign="Top" ShowBorder="false" ShowHeader="false" Title="SimpleForm"
            BodyPadding="5px" runat="server" EnableCollapse="True">
            <Items>
                <f:RadioButtonList ID="ddlSheng" Label="请选择省份" ColumnNumber="4" ShowRedStar="true" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlSheng_SelectedIndexChanged">
                </f:RadioButtonList>
            </Items>
        </f:SimpleForm>
    </form>
</body>
</html>
