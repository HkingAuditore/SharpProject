<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="keydown.aspx.cs" Inherits="FineUI.Examples.other.keydown" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" runat="server" Width="600px" BodyPadding="5px"
            Title="简单表单">
            <Items>
                <f:TextBox ID="TextBox1" runat="server" ShowLabel="false" EmptyText="输入一些文字，下面的文本框会随之改变">
                    <Listeners>
                        <f:Listener Event="change" Handler="onTextBoxChange" />
                    </Listeners>
                </f:TextBox>
                <f:TextBox ID="TextBox2" runat="server" ShowLabel="false">
                </f:TextBox>
            </Items>
        </f:SimpleForm>
    </form>
    <script src="../res/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        var textbox2ClientID = '<%= TextBox2.ClientID %>';

        function onTextBoxChange() {
            F(textbox2ClientID).setValue(this.getValue());
        }



        //F.ready(function () {
        //    var textbox1 = F(textbox1ClientID);
        //    var textbox2 = F(textbox2ClientID);


        //    function updateTextbox2() {
        //        textbox2.setValue(textbox1.getValue());
        //    }

        //    textbox1.on('change', function (e) {
        //        updateTextbox2();
        //    });
        //});

    </script>
</body>
</html>
