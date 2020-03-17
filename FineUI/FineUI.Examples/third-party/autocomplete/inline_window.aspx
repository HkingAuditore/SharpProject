<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inline_window.aspx.cs" Inherits="FineUI.Examples.autocomplete.inline_window" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../res/jqueryuiautocomplete/jquery-ui.css" />
    <link rel="stylesheet" href="../res/jqueryuiautocomplete/theme-start/theme.css" />
    
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="SimpleForm1" runat="server" Width="500px" Layout="Fit" BodyPadding="5px" EnableCollapse="true"
            Title="简单表单">
            <Items>
                <f:SimpleForm ShowBorder="false" ShowHeader="false" runat="server">
                    <Items>
                        <f:TextBox ID="TextBox1" runat="server" ShowLabel="false" EmptyText="输入字母 a 试试">
                        </f:TextBox>
                        <f:Button Text="获取输入值" ID="Button1" runat="server" OnClick="Button1_Click"></f:Button>
                        <f:Label runat="server" ID="labResult"></f:Label>
                    </Items>
                </f:SimpleForm>
            </Items>
        </f:Window>
    </form>
    <script src="../../res/js/jquery.min.js" type="text/javascript"></script>
    <script src="../res/jqueryuiautocomplete/jquery-ui.js" type="text/javascript"></script>
    <script type="text/javascript">
        var textbox1ID = '<%= TextBox1.ClientID %>';

        F.ready(function () {

            var availableTags = [
                "ActionScript",
                "AppleScript",
                "Asp",
                "BASIC",
                "C",
                "C++",
                "Clojure",
                "COBOL",
                "ColdFusion",
                "Erlang",
                "Fortran",
                "Groovy",
                "Haskell",
                "Java",
                "JavaScript",
                "Lisp",
                "Perl",
                "PHP",
                "Python",
                "Ruby",
                "Scala",
                "Scheme"];

            $('#' + textbox1ID + ' input').autocomplete({
                source: availableTags,
                open: function (event, ui) {
                    var inputEl = $(this);
                    // 当前输入框所在窗体的z-index
                    var wndZIndex = parseInt(inputEl.parents('.x-window').css('z-index'), 10);

                    // 设置autocomplete弹出层的z-index
                    inputEl.autocomplete('widget').css('z-index', wndZIndex + 1);
                }
            });

        });

    </script>
</body>
</html>
