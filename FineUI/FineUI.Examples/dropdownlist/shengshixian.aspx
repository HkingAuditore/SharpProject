<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shengshixian.aspx.cs" Inherits="FineUI.Examples.data.shengshixian" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" runat="server" BodyPadding="5px" Width="550px" EnableCollapse="true"
            Title="简单表单">
            <Items>
                <f:DropDownList ID="ddlSheng" Label="省份" ShowRedStar="true" CompareType="String"
                    CompareValue="-1" CompareOperator="NotEqual" CompareMessage="请选择省份！" runat="server"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlSheng_SelectedIndexChanged">
                </f:DropDownList>
                <f:DropDownList ID="ddlShi" Label="地区市" ShowRedStar="true" CompareType="String"
                    CompareValue="-1" CompareOperator="NotEqual" CompareMessage="请选择地区市！" runat="server" Enabled="false"
                    AutoPostBack="true" OnSelectedIndexChanged="ddlShi_SelectedIndexChanged">
                </f:DropDownList>
                <f:DropDownList ID="ddlXian" ShowRedStar="true" CompareType="String" CompareValue="-1"
                    CompareOperator="NotEqual" CompareMessage="请选择县区市！" Label="县区市" runat="server" Enabled="false">
                </f:DropDownList>
                <f:Button ID="btnSubmit" runat="server" Text="获取选中的省市县" ValidateForms="SimpleForm1"
                    ValidateTarget="Top" OnClick="btnSubmit_Click">
                </f:Button>

            </Items>
        </f:SimpleForm>
        <br />
        <f:Label ID="labResult" runat="server" ShowLabel="false" CssStyle="font-weight:bold;">
        </f:Label>
        <br />
    </form>
</body>
</html>
