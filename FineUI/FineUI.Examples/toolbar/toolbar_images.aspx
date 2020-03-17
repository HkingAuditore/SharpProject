<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="toolbar_images.aspx.cs"
    Inherits="FineUI.Examples.toolbar.toolbar_images" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Panel runat="server" ID="Panel1" Title="面板" Width="650px" Height="250px"
            EnableIFrame="true" IFrameName="main" EnableCollapse="true">
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Top">
                    <Items>
                        <f:Image ID="Image1" CssClass="toobar-img" runat="server" Icon="ArrowRight">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button1" Text="按钮一" EnablePostBack="false"
                            OnClientClick="alert('Button1');">
                        </f:LinkButton>
                        <f:Image ID="Image2" CssClass="toobar-img" runat="server" Icon="World">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button2" Text="按钮二" EnablePostBack="false"
                            OnClientClick="alert('Button2');">
                        </f:LinkButton>
                        <f:Image ID="Image3" CssClass="toobar-img" runat="server" Icon="Cake">
                        </f:Image>
                        <f:LinkButton runat="server" ID="Button3" Text="按钮三" EnablePostBack="false"
                            OnClientClick="alert('Button3');">
                        </f:LinkButton>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Panel>
        <br />
        <br />
        注：
        <ul>
            <li>由于页面布局时图片尚未加载，所以会造成布局错乱</li>
            <li>需要自己通过脚本在所有图片加载完毕后，重新对面板进行布局</li>
        </ul>
    </form>
    <script src="../res/js/jquery.min.js"></script>
    <script>

        // 布局时图片尚未加载，所以需要在图片完成加载后重新布局
        var panelClientID = '<%= Panel1.ClientID %>';
        F.ready(function () {

            // 返回 Deferred 对象数组
            var imagdefs = $('.toobar-img img').map(function () {
                var imgEl = $(this);
                return $.Deferred(function (def) {
                    imgEl.load(function () {
                        //console.log('load img:' + imgEl.attr('src'));
                        def.resolve();
                    });
                }).promise();
            });

            // 等工具栏上的全部图片加载完毕后，再重新布局
            $.when.apply($, $.makeArray(imagdefs)).done(function () {
                F(panelClientID).doLayout();
            });

        });



    </script>
</body>
</html>
