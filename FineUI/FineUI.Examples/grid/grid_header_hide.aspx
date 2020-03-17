<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="grid_header_hide.aspx.cs" 
    Inherits="FineUI.Examples.grid.grid_header_hide" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Grid ID="Grid1" ShowBorder="true" ShowHeader="false" Title="表格" Width="300px" Height="200px" runat="server" EnableCollapse="true"
            DataKeyNames="Id,Name" ShowGridHeader="false" EnableRowLines="false" EnableAlternateRowColor="false">
            <Columns>
                <f:BoundField ExpandUnusedSpace="true" DataField="Name" DataFormatString="{0}" HeaderText="姓名" />
            </Columns>
        </f:Grid>
        <br />
        注：本表格隐藏了表头、行分隔线、间隔行背景色。
        <br />
        <br />
        <f:Button ID="Button1" runat="server" Text="选中了哪些行" OnClick="Button1_Click">
        </f:Button>
        <br />
        <f:Label ID="labResult" EncodeText="false" runat="server">
        </f:Label>
    </form>
</body>
</html>
