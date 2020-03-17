<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="button_in_form.aspx.cs"
    Inherits="FineUI.Examples.other.button_in_form" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <style>
        .btn-in-form
        {
            margin-bottom: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <x:PageManager ID="PageManager1" runat="server" />
    <x:Form ID="SimpleForm1" BodyPadding="5px" Width="550px" LabelAlign="Left" LabelWidth="80px"
         Title="表单" runat="server">
        <Rows>
            <x:FormRow ID="FormRow5">
                <Items>
                    <x:TextBox ID="TextBox1" runat="server" Label="文本一">
                    </x:TextBox>
                    <x:Button ID="Button4" CssClass="btn-in-form" runat="server" Text="按钮一">
                    </x:Button>
                </Items>
            </x:FormRow>
            <x:FormRow ID="FormRow6" runat="server">
                <Items>
                    <x:TextBox ID="TextBox2" runat="server" Label="文本二">
                    </x:TextBox>
                    <x:Button ID="Button3" CssClass="btn-in-form" runat="server" Text="按钮二">
                    </x:Button>
                </Items>
            </x:FormRow>
            <x:FormRow ID="FormRow7" runat="server">
                <Items>
                    <x:TextBox ID="TextBox3" runat="server" Label="文本三">
                    </x:TextBox>
                    <x:Button ID="Button1" CssClass="btn-in-form" runat="server" Text="按钮三">
                    </x:Button>
                </Items>
            </x:FormRow>
            <x:FormRow ID="FormRow8" runat="server">
                <Items>
                    <x:TextBox ID="TextBox4" runat="server" Label="文本四">
                    </x:TextBox>
                    <x:Button ID="Button2" CssClass="btn-in-form" runat="server" Text="按钮四">
                    </x:Button>
                </Items>
            </x:FormRow>
        </Rows>
    </x:Form>
    </form>
</body>
</html>
