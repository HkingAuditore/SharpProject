<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="default.aspx.cs" Inherits="FineUI.Examples.iframe.topmenu4._default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>顶部菜单框架（四）</title>
    <meta name="sourcefiles" content="~/iframe/topmenu4/leftmenu.aspx" />
    <link type="text/css" rel="stylesheet" href="./res/main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="Panel1" runat="server"></f:PageManager>
        <f:Panel ID="Panel1" Layout="Region" ShowBorder="false" ShowHeader="false" runat="server">
            <Items>
                <f:ContentPanel RegionPosition="Top" ShowBorder="false" CssClass="jumbotron" ShowHeader="false" runat="server">
                    <div class="wrap">
                        <div class="logos">
                            XXX 管理系统
                        </div>
                        <div class="menu">
                            <ul>
                                <li class="selected menu-mail"><a href="javascript:;"><span>邮件收发</span></a> </li>
                                <li class="menu-sms"><a href="javascript:;"><span>短信收发</span></a> </li>
                                <li class="menu-sys"><a href="javascript:;"><span>系统管理</span></a> </li>
                            </ul>
                        </div>
                        <div class="member">
                            领先的 XXX 管理系统欢迎您！
                        </div>
                        <div class="exit">
                            <a href="javascript:;">退出管理</a>
                        </div>
                    </div>
                </f:ContentPanel>
                <f:Panel ID="Region2" RegionPosition="Left" RegionSplit="true" Width="200px"
                    ShowHeader="true" Title="业务菜单" Icon="Outline"
                    EnableCollapse="true" EnableIFrame="true" IFrameName="leftframe" IFrameUrl="about:blank"
                    runat="server">
                </f:Panel>
                <f:TabStrip ID="mainTabStrip" RegionPosition="Center" EnableTabCloseMenu="true"  ShowBorder="true" runat="server">
                    <Tabs>
                        <f:Tab ID="Tab1" Title="首页" Layout="Fit" Icon="House" CssClass="maincontent" runat="server">
                            <Items>
                                <f:ContentPanel ID="ContentPanel1" ShowBorder="false" BodyPadding="10px" ShowHeader="false" AutoScroll="true"
                                    runat="server">
                                    首页内容
                                </f:ContentPanel>
                            </Items>
                        </f:Tab>
                    </Tabs>
                </f:TabStrip>
            </Items>
        </f:Panel>
    </form>
    <script src="../../res/js/jquery.min.js" type="text/javascript"></script>
    <script>
        var mainTabStripClientID = '<%= mainTabStrip.ClientID %>';

        F.ready(function () {

            window.mainTabStrip = F(mainTabStripClientID);

            var menuLis = $('.menu ul li');

            function updateLeftMenu(menuType) {

                menuLis.removeClass('selected');
                menuLis.filter('.menu-' + menuType).addClass('selected');

                window.frames['leftframe'].location.href = './leftmenu.aspx?menu=' + encodeURIComponent(menuType);
            }

            // 点击顶部菜单，加载左侧IFrame菜单
            menuLis.click(function (e) {
                var $this = $(this);
                var classNames = /menu\-(\w+)/.exec($this.attr('class'));
                if (classNames.length == 2) {
                    var menuType = classNames[1];

                    updateLeftMenu(menuType);
                }
            });

            // 根据页面的Hash值，来初始化左侧IFrame菜单
            var hash = window.location.hash;
            var hashArray = /.+\/html\/(.+)\-\d+\.html/.exec(hash);
            if (hashArray && hashArray.length === 2) {
                updateLeftMenu(hashArray[1]);
            } else {
                updateLeftMenu('mail');
            }


            window.initTreeTabStrip = function (tree) {
                // 初始化主框架中的树(或者Accordion+Tree)和选项卡互动，以及地址栏的更新
                // treeMenu： 主框架中的树控件实例，或者内嵌树控件的手风琴控件实例
                // mainTabStrip： 选项卡实例
                // addTabCallback： 创建选项卡前的回调函数（接受tabConfig参数）
                // updateLocationHash: 切换Tab时，是否更新地址栏Hash值
                // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame
                // refreshWhenTabChange: 切换选项卡时，是否刷新内部IFrame
                // hashWindow：需要更新Hash值的窗口对象，默认为当前window
                F.initTreeTabStrip(tree, mainTabStrip, null, true, false, false);
            };

        });


    </script>
</body>
</html>
