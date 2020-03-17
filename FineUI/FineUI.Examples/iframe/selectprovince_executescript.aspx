<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectprovince_executescript.aspx.cs"
    Inherits="FineUI.Examples.iframe.selectprovince_executescript" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="sourcefiles" content="~/iframe/selectprovince_executescript_child.aspx" />
</head>
<body>
    <form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server" />
    <f:SimpleForm ID="SimpleForm1" Title="表单"  BodyPadding="5px"
        runat="server" Width="650px" EnableCollapse="True">
        <Items>
            <f:DropDownList ID="ddlSheng" Label="请选择省份" runat="server">
            </f:DropDownList>
            <f:Button ID="Button1" EnablePostBack="false" runat="server" Text="从列表中选择">
            </f:Button>
        </Items>
    </f:SimpleForm>
    <f:Window ID="Window1" Title="编辑" Hidden="true" EnableIFrame="true" runat="server"
        EnableMaximize="true" EnableResize="true" Target="Parent" IsModal="True"
		Width="562px" Height="470px">
    </f:Window>
    <f:Label ID="labResult" CssStyle="font-weight:bold;" runat="server">
    </f:Label>
    <br />
    </form>
    <script>
        var shengClientID = '<%= ddlSheng.ClientID %>';

        function selectProvince(name) {
            F(shengClientID).setValue(name);
        }
    </script>
</body>
</html>
