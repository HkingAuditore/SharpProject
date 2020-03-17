<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_hide_gridheader.aspx.cs" Inherits="FineUI.Examples.grid.grid_hide_gridheader" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="表格" Width="300px" runat="server" EnableCollapse="true"
            DataKeyNames="Guid,Name" ShowGridHeader="false" EnableRowLines="false" EnableAlternateRowColor="false" Height="200px">
            <Columns>
                <f:BoundField ExpandUnusedSpace="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
            </Columns>
        </f:Grid>
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
