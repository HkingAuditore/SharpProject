﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileupload_toolbar.aspx.cs"
    Inherits="FineUI.Examples.form.fileupload_toolbar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <style>
        .photo {
            height: 150px;
            line-height: 150px;
            overflow: hidden;
        }

            .photo img {
                height: 150px;
                vertical-align: middle;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:SimpleForm ID="SimpleForm1" BodyPadding="5px" runat="server" Width="550px"  EnableCollapse="true"
            ShowBorder="True" Title="表单">
            <Items>
                <f:Image ID="imgPhoto" CssClass="photo" ImageUrl="~/res/images/blank.png" ShowEmptyLabel="true" runat="server">
                </f:Image>
                <f:TextBox runat="server" Label="用户名" ID="tbxUserName" Required="true" ShowRedStar="true">
                </f:TextBox>
                <f:TextBox runat="server" Label="邮箱" ID="tbxEmail" Required="true" RegexPattern="EMAIL"
                    ShowRedStar="true">
                </f:TextBox>

            </Items>
            <Toolbars>
                <f:Toolbar Position="Bottom" ToolbarAlign="Right" runat="server">
                    <Items>
                        <f:FileUpload runat="server" ID="filePhoto" ButtonText="上传个人头像" AcceptFileTypes="image/*" ButtonOnly="true"
                            AutoPostBack="true" OnFileSelected="filePhoto_FileSelected">
                        </f:FileUpload>
                        <f:Button runat="server" Icon="SystemSave" ID="btnSubmit" OnClick="btnSubmit_Click"
                            ValidateForms="SimpleForm1" Text="提交表单">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:SimpleForm>
        <br />
        注意：上传个人头像通过 AcceptFileTypes="image/*" 来控制默认显示的文件类型。
    </form>
</body>
</html>
