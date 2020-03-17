<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowArray.aspx.cs" Inherits="WebSharp.ShowArray" %>

<!DOCTYPE html>
<style>
    .title { color: #4c4228; }

    .custom-confirm-btn {
        background-color: #3764be;
        border: 2px solid #3764be;
        border-radius: 10px;
        color: #ffffff;
        font-size: 20px !important;
        width: 100%;
    }

    .custom-confirm-btn:hover {
        background-color: #00c4ff;
        border-color: #00c4ff;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px 1px rgba(0, 196, 255, 0.50);
        color: rgb(255, 255, 255) !important;
    }

    .custom-confirm-btn:focus {
        background-color: #00c4ff;
        border-color: #00c4ff;
        color: rgb(255, 255, 255);
    }

    .custom-confirm-btn:active {
        background-color: #00c4ff;
        border-color: #00c4ff;
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px 3px rgba(0, 196, 255, 0.50);
        color: rgb(255, 255, 255);
    }
</style>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="ie=edge" http-equiv="X-UA-Compatible"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="ie=edge" http-equiv="X-UA-Compatible"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="~/Framework/bootstrap.css" rel="stylesheet"/>
    <link href="~/Framework/bootstrap-theme.css" rel="stylesheet"/>
    <script src="~/Framework/Content/Scripts/bootstrap.min.js"></script>
    <script src="~/Framework/jQuery.1.10.2/Content/Scripts/jquery-1.10.2.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>Array Test</title>
</head>

<body>
<form id="form1" runat="server">
    <f:PageManager ID="PageManager1" runat="server"/>
    <f:Panel ID="Panel5" runat="server" Width="1000px" Height="600px" ShowBorder="True" EnableCollapse="true"
             Layout="HBox" AutoScroll="False" BodyPadding="5"
             ShowHeader="True" Title="C#常用Collection展示">
        <Items>
            <f:Panel ID="Panel1" Title="面板1" BoxFlex="2" runat="server" Margin="0 5 0 0"
                     BodyPadding="5px" ShowBorder="true" ShowHeader="false" Layout="VBox">
                <Items>
                    <%-- <f:Form ID="Form2" runat="server" ShowBorder="True" BodyPadding="5px" ShowHeader="false" Title="表单"> --%>
                        <f:Form ID="SimpleForm2" runat="server" Width="550px" ShowBorder="false" CssStyle="margin-bottom:5px;" ShowHeader="false" Layout="Column" CssClass="formitem" BodyPadding="5px">
                            <Rows>    
                            <f:FormRow>    
                                    <Items>
                                    <f:Button ID="NormalArray"  runat="server" Text="[]" OnClick="NormalArray_Click" ></f:Button>
                                    <f:Button ID="Array"   runat="server" Text="Array" OnClick="Array_Click" ></f:Button>
                                    <f:Button ID="ArrayList"   runat="server" Text="ArrayList" OnClick="ArrayList_Click" ></f:Button>
                                    <f:Button ID="List"  runat="server" Text="List" OnClick="List_Click"></f:Button>
                                    <f:Button ID="Dictionary"  runat="server" Text="Dictionary" OnClick="Dictionary_Click" ></f:Button>
                                    <f:Button ID="HashTable"  runat="server" Text="HashTable" OnClick="HashTable_Click" ></f:Button>
                                    </Items>
                                </f:FormRow>
                            </Rows>
                        </f:Form>
                        <%-- <f:Panel ID="Panel4" runat="server" ShowBorder="false" CssStyle="margin-bottom:5px;" ShowHeader="false"> --%>
                        <f:Form ID="SimpleForm1" BodyPadding="5px" Width="550px" LabelAlign="Left" LabelWidth="110px"
                                Title="表单" ShowHeader="false" runat="server">
                            <Rows>
                                <f:FormRow>
                                <Items>
                                    <f:TextBox runat="server" Label="新增元素" ID="AddElement"></f:TextBox>
                                    <f:Button ID="AddButton" runat="server" Text="增加"  OnClick="AddButton_Click"/>
                                </Items>
                                </f:FormRow>
                                <f:FormRow>
                                <Items>
                                    <f:TextBox runat="server" Label="新增键值对<键>" ID="AddKey"></f:TextBox>
                                    <f:TextBox runat="server" Label="新增键值对<值>" ID="AddValue"></f:TextBox>
                                    <f:Button ID="AddKeyValueButton" runat="server" Text="增加"  OnClick="AddKeyValueButton_Click"/>
                                </Items>
                                </f:FormRow>
                                <f:FormRow>
                                <Items>
                                    <f:TextBox runat="server" Label="删除元素" ID="RemoveElement"></f:TextBox>
                                    <f:Button ID="RemoveElementButton" runat="server" Text="删除"  OnClick="RemoveElementButton_Click"/>
                                </Items>
                                </f:FormRow>
                                <f:FormRow>
                                <Items>
                                    <f:TextBox runat="server" Label="删除键" ID="RemoveKey"></f:TextBox>
                                    <f:Button ID="RemoveKeyButton" runat="server" Text="删除"  OnClick="RemoveKeyButton_Click"/>
                                </Items>
                                </f:FormRow>
                                <f:FormRow Width="160px">
                                <Items>
                                    <f:Button ID="SequenceSort" runat="server" Text="顺序排序" OnClick="SequenceSort_Click"/>
                                    <f:Button ID="ReverseSort" runat="server" Text="逆序排序"  OnClick="ReverseSort_Click"/>
                                </Items>
                                </f:FormRow>

                            </Rows>
                    </f:Form>
                    <%-- </f:Panel> --%>
                </Items>

            </f:Panel>

            <f:Panel ID="Panel2" Title="面板2" BoxFlex="1"
                     runat="server" BodyPadding="5px" ShowBorder="true" AutoScroll="True" ShowHeader="false" EnableCollapse="true">
                <Items>
                    <f:Label ID="Info" runat="server" EncodeText="false" Text="内容显示">
                    </f:Label>
                </Items>
            </f:Panel>
        </Items>
    </f:Panel>

</form>
</body>
</html>