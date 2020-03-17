<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="FineUI.Examples._default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>FineUI（开源版）在线示例 - 基于 ExtJS 的开源 ASP.NET 控件库</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <meta name="Title" content="基于 ExtJS 的开源 ASP.NET 控件库(ExtJS based open source ASP.NET Controls)" />
    <meta name="Description" content="FineUI 的使命是创建 No JavaScript，No CSS，No UpdatePanel，No ViewState，No WebServices 的网站应用程序" />
    <meta name="Keywords" content="开源,ASP.NET,控件库,ExtJS,AJAX,Web2.0" />
    <link type="text/css" rel="stylesheet" href="~/res/css/default.css" />
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:Panel ID="RegionPanel1" Layout="Region" ShowBorder="false" runat="server">
            <Items>
                <f:ContentPanel ID="Region1" ShowBorder="false" ShowHeader="false"
                    RegionPosition="Top" runat="server">
                    <div id="header">
                        <table>
                            <tr>
                                <td>
                                    <a class="homepage" href="http://fineui.com/" title="官网首页">
                                        <img src="./res/icon/house.png" alt="Home" />
                                    </a>
                                    <a class="logo" href="./default.aspx" title="在线示例首页">FineUI（开源版）在线示例
                                    </a>
                                </td>
                                <td style="text-align: right;">
                                    <f:Button runat="server" CssClass="" Text="企业版(MVC)" IconAlign="Top" Icon="Lightning"
                                        EnablePostBack="false" OnClientClick="window.location.href='http://fineui.com/demo_mvc';">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="" Text="专业版(WebForms)" IconAlign="Top" Icon="Star"
                                        EnablePostBack="false" OnClientClick="window.location.href='http://fineui.com/demo_pro';">
                                    </f:Button>
                                    <f:Button runat="server" CssClass="" Text="加载动画" IconAlign="Top" Icon="Hourglass"
                                        EnablePostBack="false">
                                        <Listeners>
                                            <f:Listener Event="click" Handler="onLoadingSelectClick" />
                                        </Listeners>
                                    </f:Button>
                                    <f:Button runat="server" CssClass="userpicaction" Text="三生石上" IconUrl="~/res/images/my_face_80.jpg" IconAlign="Left"
                                        EnablePostBack="false">
                                        <Menu runat="server">
                                            <f:MenuCheckBox runat="server" ID="cbxShowOnlyNew" Text="仅显示最新示例">
                                            </f:MenuCheckBox>
                                            <f:MenuSeparator ID="MenuSeparator1" runat="server">
                                            </f:MenuSeparator>
                                            <f:MenuButton ID="MenuTheme" EnablePostBack="false" Text="主题" runat="server">
                                                <Menu ID="Menu4" runat="server">
                                                    <f:MenuCheckBox Text="海卫一（Triton）" ID="MenuThemeTriton" Checked="true" GroupName="MenuTheme" runat="server">
                                                    </f:MenuCheckBox>
                                                    <f:MenuCheckBox Text="小清新（Crisp）" ID="MenuThemeCrisp" GroupName="MenuTheme" runat="server">
                                                    </f:MenuCheckBox>
                                                    <f:MenuCheckBox Text="海王星（Neptune）" ID="MenuThemeNeptune" GroupName="MenuTheme" runat="server">
                                                    </f:MenuCheckBox>
                                                    <f:MenuCheckBox Text="蓝色（Blue）" ID="MenuThemeBlue" GroupName="MenuTheme" runat="server">
                                                    </f:MenuCheckBox>
                                                    <f:MenuCheckBox Text="灰色（Gray）" ID="MenuThemeGray" GroupName="MenuTheme" runat="server">
                                                    </f:MenuCheckBox>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuButton EnablePostBack="false" Text="菜单样式" ID="MenuStyle" runat="server">
                                                <Menu runat="server">
                                                    <f:MenuCheckBox Text="树菜单" ID="MenuStyleTree" Checked="true" GroupName="MenuStyle" runat="server">
                                                    </f:MenuCheckBox>
                                                    <f:MenuCheckBox Text="手风琴+树菜单" ID="MenuStyleAccordion" GroupName="MenuStyle" runat="server">
                                                    </f:MenuCheckBox>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuButton EnablePostBack="false" Text="语言" ID="MenuLang" runat="server">
                                                <Menu ID="Menu2" runat="server">
                                                    <f:MenuCheckBox Text="简体中文" ID="MenuLangZHCN" Checked="true" GroupName="MenuLang" runat="server">
                                                    </f:MenuCheckBox>
                                                    <f:MenuCheckBox Text="繁體中文" ID="MenuLangZHTW" GroupName="MenuLang" runat="server">
                                                    </f:MenuCheckBox>
                                                    <f:MenuCheckBox Text="English" ID="MenuLangEN" GroupName="MenuLang" runat="server">
                                                    </f:MenuCheckBox>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuSeparator ID="MenuSeparator2" runat="server">
                                            </f:MenuSeparator>
                                            <f:MenuButton EnablePostBack="false" Text="FineUI（开源版）示例" runat="server">
                                                <Menu runat="server">
                                                    <f:MenuHyperLink runat="server" Text="v4.x 示例" NavigateUrl="http://fineui.com/demo_v4/" Target="_blank">
                                                    </f:MenuHyperLink>
                                                    <f:MenuHyperLink runat="server" Text="v3.x 示例" NavigateUrl="http://fineui.com/demo_v3/" Target="_blank">
                                                    </f:MenuHyperLink>
                                                    <f:MenuHyperLink runat="server" Text="v3.x 示例（英文）" NavigateUrl="http://fineui.com/demo_en/" Target="_blank">
                                                    </f:MenuHyperLink>
                                                </Menu>
                                            </f:MenuButton>
                                            <f:MenuSeparator runat="server">
                                            </f:MenuSeparator>
                                            <f:MenuHyperLink runat="server" Text="FineUI（专业版）示例" NavigateUrl="http://fineui.com/demo_pro/" Target="_blank">
                                            </f:MenuHyperLink>
                                            <f:MenuHyperLink runat="server" Text="FineUI（MVC版）示例" NavigateUrl="http://fineui.com/demo_mvc/" Target="_blank">
                                            </f:MenuHyperLink>
                                            <f:MenuHyperLink runat="server" Text="FineUI（JS版）示例" NavigateUrl="http://fineui.com/demo_js/" Target="_blank">
                                            </f:MenuHyperLink>
                                        </Menu>
                                    </f:Button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </f:ContentPanel>
                <f:Panel ID="leftPanel" RegionSplit="true" Width="220px" ShowHeader="true" ShowBorder="true" Title="全部示例"
                    EnableCollapse="true" Layout="Fit" Collapsed="false" RegionPosition="Left" runat="server">
                </f:Panel>
                <f:Panel ID="mainRegion" ShowHeader="false" Layout="Fit" ShowBorder="true" RegionPosition="Center"
                    runat="server">
                    <Items>
                        <f:TabStrip ID="mainTabStrip" EnableTabCloseMenu="true" ShowBorder="false" runat="server">
                            <Tabs>
                                <f:Tab Title="首页" Layout="Fit" Icon="House" CssClass="maincontent" runat="server">
                                    <Toolbars>
                                        <f:Toolbar runat="server">
                                            <Items>
                                                <f:ToolbarFill ID="ToolbarFill2" runat="server">
                                                </f:ToolbarFill>
                                                <f:Button ID="btnGotoOpenSourceSite" Icon="DiskDownload" Text="下载全部源码" OnClientClick="window.open('https://gitee.com/sanshi/FineUI', '_blank');"
                                                    EnablePostBack="false" runat="server">
                                                </f:Button>
                                                <f:ToolbarSeparator ID="ToolbarSeparator2" runat="server">
                                                </f:ToolbarSeparator>
                                                <f:Button ID="Button1" Icon="PageGo" Text="论坛交流" OnClientClick="window.open('http://fineui.com/bbs/', '_blank');"
                                                    EnablePostBack="false" runat="server">
                                                </f:Button>
                                            </Items>
                                        </f:Toolbar>
                                    </Toolbars>
                                    <Items>
                                        <f:ContentPanel ShowBorder="false" BodyPadding="10px" ShowHeader="false" AutoScroll="true"
                                            runat="server">
                                            <h2>FineUI（开源版）</h2>
                                            基于 ExtJS 的开源 ASP.NET 控件库
                                        
                                            <br />
                                            <h2>FineUI的使命</h2>
                                            创建 No JavaScript，No CSS，No UpdatePanel，No ViewState，No WebServices 的网站应用程序
                                        
                                            <br />
                                            <h2>支持的浏览器</h2>
                                            Chrome、Firefox、Safari、IE 8.0+<sup>*</sup>

                                            <br />
                                            <h2>授权协议</h2>
                                            Apache License v2.0（ExtJS 库在 <a target="_blank" href="http://www.sencha.com/license">GPL v3</a> 协议下发布）
                                            
                                            <br />
                                            <h2>相关链接</h2>
                                            首页：<a target="_blank" href="http://fineui.com/">http://fineui.com/</a>
                                            <br />
                                            论坛：<a target="_blank" href="http://fineui.com/bbs/">http://fineui.com/bbs/</a>
                                            <br />
                                            示例：<a target="_blank" href="http://fineui.com/demo/">http://fineui.com/demo/</a>
                                            <br />
                                            文档：<a target="_blank" href="http://fineui.com/doc/">http://fineui.com/doc/</a>
                                            <br />
                                            下载：<a target="_blank" href="https://gitee.com/sanshi/FineUI">https://gitee.com/sanshi/FineUI</a>
                                            <br />
                                            <br />
                                            注：FineUI 不再内置 ExtJS 库，请手工添加 ExtJS 库：<a target="_blank" href="http://fineui.com/bbs/forum.php?mod=viewthread&tid=3218">http://fineui.com/bbs/forum.php?mod=viewthread&tid=3218</a>
                                            <br />
                                            <br />
                                            <div style="font-size: 11px;">
                                                * 推荐使用 Chrome、Firefox、Edge、IE11 浏览器，以获取最好的性能。
                                                <div style="margin: 10px 8px; opacity: 0.6;">
                                                    IE8.0 浏览器有限支持，存在如下已知问题：
                                                    <ul style="margin-top: 2px; padding-left: 20px;">
                                                        <li>相比其他现代浏览器，性能最差</li>
                                                        <li>不支持圆角，以及其他一些 CSS3 特性</li>
                                                        <li>选项卡控件不支持左侧和右侧标题栏</li>
                                                    </ul>
                                                </div>
                                            </div>

                                        </f:ContentPanel>
                                    </Items>
                                </f:Tab>
                            </Tabs>
                        </f:TabStrip>
                    </Items>
                </f:Panel>
                <f:Panel ID="bottomPanel" RegionPosition="Bottom" ShowBorder="false" ShowHeader="false"
                    EnableCollapse="false" runat="server" Layout="Fit">
                    <Items>
                        <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false">
                            <table class="bottomtable">
                                <tr>
                                    <td style="width: 300px;">&nbsp;版本：<a target="_blank" href="http://fineui.com/version">v<asp:Literal runat="server" ID="litVersion"></asp:Literal></a>
                                        &nbsp;&nbsp; <a target="_blank" href="http://wp.qq.com/wpa/qunwpa?idkey=5a98eb42b742a1edaf22826648d5f61bc16ed08e0253976bc8d30f97508c09c7">QQ公开群</a></td>
                                    <td style="text-align: center;">Copyright &copy; 2008-2017 合肥三生石上软件有限公司</td>
                                    <td style="width: 300px; text-align: right;">在线人数：<asp:Literal runat="server" ID="litOnlineUserCount"></asp:Literal>&nbsp;</td>
                                </tr>
                            </table>
                        </f:ContentPanel>
                    </Items>
                </f:Panel>
            </Items>
        </f:Panel>
        <f:Window ID="windowSourceCode" Icon="PageWhiteCode" Title="源代码" Hidden="true" EnableIFrame="true"
            runat="server" IsModal="true" Width="950px" Height="550px" EnableClose="true"
            EnableMaximize="true" EnableResize="true">
        </f:Window>
        <f:Window ID="windowLoadingSelector" Title="加载动画" Hidden="true" EnableIFrame="true" IFrameUrl="./common/loading.aspx"
            runat="server" IsModal="true" Width="1000px" Height="625px" EnableClose="true"
            EnableMaximize="true" EnableResize="true">
        </f:Window>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" EnableCaching="false" DataFile="~/common/menu.xml"></asp:XmlDataSource>
    </form>
    <script src="./res/js/jquery.min.js"></script>
    <script>

        var leftPanelClientID = '<%= leftPanel.ClientID %>';
        var mainTabStripClientID = '<%= mainTabStrip.ClientID %>';
        var windowSourceCodeClientID = '<%= windowSourceCode.ClientID %>';
        var cbxShowOnlyNewClientID = '<%= cbxShowOnlyNew.ClientID %>';
        var windowLoadingSelectorClientID = '<%= windowLoadingSelector.ClientID %>';

        var MenuStyleClientID = '<%= MenuStyle.ClientID %>';
        var MenuLangClientID = '<%= MenuLang.ClientID %>';
        var MenuThemeClientID = '<%= MenuTheme.ClientID %>';


        // 点击加载动画
        function onLoadingSelectClick(event) {
            var windowLoadingSelector = F(windowLoadingSelectorClientID);
            windowLoadingSelector.f_show();
        }


        // 添加示例标签页
        // id： 选项卡ID
        // iframeUrl: 选项卡IFrame地址 
        // title： 选项卡标题
        // icon： 选项卡图标
        // createToolbar： 创建选项卡前的回调函数（接受tabOptions参数）
        // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame
        // iconFont： 选项卡图标字体
        function addExampleTab(tabOptions) {

            if (typeof (tabOptions) === 'string') {
                tabOptions = {
                    id: arguments[0],
                    iframeUrl: arguments[1],
                    title: arguments[2],
                    icon: arguments[3],
                    createToolbar: arguments[4],
                    refreshWhenExist: arguments[5],
                    iconFont: arguments[6]
                };
            }

            F.addMainTab(F(mainTabStripClientID), tabOptions);
        }

        // 移除选中标签页
        function removeTab(tabId) {
            var mainTabStrip = F(mainTabStripClientID);
            mainTabStrip.removeTab(tabId);
        }

        // 移除选中标签页
        function removeActiveTab() {
            var mainTabStrip = F(mainTabStripClientID);
            var activeTab = mainTabStrip.getActiveTab();
            mainTabStrip.removeTab(activeTab.id);
        }

        // 获取当前激活选项卡的ID
        function getActiveTabId() {
            var mainTabStrip = F(mainTabStripClientID);

            var activeTab = mainTabStrip.getActiveTab();
            if (activeTab) {
                return activeTab.id;
            }
            return '';
        }

        // 激活选项卡，并刷新其中的内容，示例：表格控件->杂项->在新标签页中打开（关闭后刷新父选项卡）
        function activeTabAndRefresh(tabId) {
            var mainTabStrip = F(mainTabStripClientID);
            var targetTab = mainTabStrip.getTab(tabId);
            var oldActiveTabId = getActiveTabId();

            if (targetTab) {
                mainTabStrip.setActiveTab(targetTab);
                // 通过jQuery查找 iframe 节点，并强制刷新 iframe 内的页面
                $(targetTab.el.dom).find('iframe')[0].contentWindow.location.reload();

                // 删除之前的激活选项卡
                mainTabStrip.removeTab(oldActiveTabId);
            }
        }

        // 激活选项卡，并刷新其中的内容，示例：表格控件->杂项->在新标签页中打开（关闭后更新父选项卡中的表格）
        function activeTabAndUpdate(tabId, param1) {
            var mainTabStrip = F(mainTabStripClientID);
            var targetTab = mainTabStrip.getTab(tabId);
            var oldActiveTabId = getActiveTabId();

            if (targetTab) {
                mainTabStrip.setActiveTab(targetTab);
                // 通过jQuery查找 iframe 节点，并调用 iframe 内的页面的自定义JS函数 updatePage
                $(targetTab.el.dom).find('iframe')[0].contentWindow.updatePage(param1);

                // 删除之前的激活选项卡
                mainTabStrip.removeTab(oldActiveTabId);
            }
        }

        F.ready(function () {
            var leftPanel = F(leftPanelClientID);
            var mainTabStrip = F(mainTabStripClientID);
            var windowSourceCode = F(windowSourceCodeClientID);
            var cbxShowOnlyNew = F(cbxShowOnlyNewClientID);

            var MenuStyle = F(MenuStyleClientID);
            var MenuLang = F(MenuLangClientID);
            var MenuTheme = F(MenuThemeClientID);

            var treeMenu = leftPanel.items.getAt(0);
            var menuType = 'accordion';
            if (treeMenu.isXType('treepanel')) {
                menuType = 'menu';
            }


            // 点击仅显示最新示例
            cbxShowOnlyNew.on('click', function () {
                var checked = this.checked;
                if (checked) {
                    F.cookie('ShowOnlyNew_v6', checked, {
                        expires: 100 // 单位：天
                    });
                } else {
                    F.removeCookie('ShowOnlyNew_v6');
                }
                top.window.location.reload();
            });

            // 点击菜单样式
            function MenuStyleItemCheckChange(cmp, checked) {
                if (checked) {
                    var menuStyle = 'accordion';
                    if (cmp.id.indexOf('MenuStyleTree') >= 0) {
                        menuStyle = 'tree';
                    }
                    F.cookie('MenuStyle_v6', menuStyle, {
                        expires: 100 // 单位：天
                    });
                    top.window.location.reload();
                }
            }
            MenuStyle.menu.items.each(function (item, index) {
                item.on('checkchange', MenuStyleItemCheckChange);
            });


            // 切换语言
            function MenuLangItemCheckChange(cmp, checked) {
                if (checked) {
                    var lang = 'en';
                    if (cmp.id.indexOf('MenuLangZHCN') >= 0) {
                        lang = 'zh_CN';
                    } else if (cmp.id.indexOf('MenuLangZHTW') >= 0) {
                        lang = 'zh_TW';
                    }

                    F.cookie('Language_v6', lang, {
                        expires: 100 // 单位：天
                    });
                    top.window.location.reload();
                }
            }
            MenuLang.menu.items.each(function (item, index) {
                item.on('checkchange', MenuLangItemCheckChange);
            });


            // 切换主题
            function MenuThemeItemCheckChange(cmp, checked) {
                if (checked) {
                    var lang = 'neptune';
                    if (cmp.id.indexOf('MenuThemeBlue') >= 0) {
                        lang = 'blue';
                    } else if (cmp.id.indexOf('MenuThemeGray') >= 0) {
                        lang = 'gray';
                    } else if (cmp.id.indexOf('MenuThemeCrisp') >= 0) {
                        lang = 'crisp';
                    } else if (cmp.id.indexOf('MenuThemeTriton') >= 0) {
                        lang = 'triton';
                    }

                    F.cookie('Theme_v6', lang, {
                        expires: 100 // 单位：天
                    });
                    top.window.location.reload();
                }
            }
            MenuTheme.menu.items.each(function (item, index) {
                item.on('checkchange', MenuThemeItemCheckChange);
            });


            function createToolbar(tabConfig) {

                // 由工具栏上按钮获得当前标签页中的iframe节点
                function getCurrentIFrameNode(btn) {
                    return $('#' + btn.id).parents('.f-tab').find('iframe');
                }

                var sourcecodeButton = new Ext.Button({
                    text: '源代码',
                    type: 'button',
                    icon: './res/icon/page_white_code.png',
                    listeners: {
                        click: function () {
                            var iframeNode = getCurrentIFrameNode(this);
                            var iframeWnd = iframeNode[0].contentWindow

                            var files = [iframeNode.attr('src')];
                            var sourcefilesNode = $(iframeWnd.document).find('head meta[name=sourcefiles]');
                            if (sourcefilesNode.length) {
                                $.merge(files, sourcefilesNode.attr('content').split(';'));
                            }
                            windowSourceCode.f_show('./common/source.aspx?files=' + encodeURIComponent(files.join(';')));
                        }
                    }
                });

                var openNewWindowButton = new Ext.Button({
                    text: '新标签页中打开',
                    type: 'button',
                    icon: './res/icon/tab_go.png',
                    listeners: {
                        click: function () {
                            var iframeNode = getCurrentIFrameNode(this);
                            window.open(iframeNode.attr('src'), '_blank');
                        }
                    }
                });

                var refreshButton = new Ext.Button({
                    text: '刷新',
                    type: 'button',
                    icon: './res/icon/reload.png',
                    listeners: {
                        click: function () {
                            var iframeNode = getCurrentIFrameNode(this);
                            iframeNode[0].contentWindow.location.reload();
                        }
                    }
                });

                var toolbar = new Ext.Toolbar({
                    items: ['->', sourcecodeButton, '-', refreshButton, '-', openNewWindowButton]
                });

                tabConfig['tbar'] = toolbar;
            }



            // 此函数源代码定义在：extjs_builder\js\F\F.util.js

            // 初始化主框架中的树(或者Accordion+Tree)和选项卡互动，以及地址栏的更新
            // treeMenu： 主框架中的树控件实例，或者内嵌树控件的手风琴控件实例
            // mainTabStrip： 选项卡实例
            // updateHash: 切换Tab时，是否更新地址栏Hash值（默认值：true）
            // refreshWhenExist： 添加选项卡时，如果选项卡已经存在，是否刷新内部IFrame（默认值：false）
            // refreshWhenTabChange: 切换选项卡时，是否刷新内部IFrame（默认值：false）
            // maxTabCount: 最大允许打开的选项卡数量
            // maxTabMessage: 超过最大允许打开选项卡数量时的提示信息
            F.initTreeTabStrip(treeMenu, mainTabStrip, {
                createToolbar: createToolbar,
                maxTabCount: 10,
                maxTabMessage: '请先关闭一些选项卡（最多允许打开 10 个）！'
            });


        });


    </script>
</body>
</html>
