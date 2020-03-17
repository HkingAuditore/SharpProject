<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="authentication_timeout_async.aspx.cs" Inherits="FineUI.Examples.other.authentication_timeout_async" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Button ID="btnRegisterHook" runat="server" Text="1. 注册跳转拦截函数" EnablePostBack="false">
            <Listeners>
                <f:Listener Event="click" Handler="onRegisterHookClick" />
            </Listeners>
        </f:Button>
        <br />
        <br />
        <f:Button ID="Button2" runat="server" Text="2. 点击回发（模拟 Forms Authentication 超时）" OnClick="Button2_Click">
        </f:Button>
        <br />
        <br />
        <br />
        请尝试如下两种不同操作步骤：
        <br />
        <br />
        <div>操作一：</div>
        <ol>
            <li>刷新页面</li>
            <li>点击按钮2 -> 直接跳转到首页</li>
        </ol>
        <br />
        <div>操作二：</div>
        <ol>
            <li>刷新页面</li>
            <li>点击按钮1</li>
            <li>点击按钮2 -> 首先弹出确认框，点击确认后才跳转到首页；如果点击取消，则留在本页</li>
        </ol>
    </form>
    <script>


        function onRegisterHookClick() {
            F.beforeAjaxSuccess(function (data) {

                // 通过返回的字符串，判断当前是否登陆超时，执行跳转
                if (data.indexOf('window.location.href=') === 0) {

                    // F.confirm是异步函数，直接返回
                    F.confirm({
                        message: '登陆超时，是否跳转到首页？',
                        ok: function () {
                            // 重新执行返回的脚本
                            new Function(data)();
                        },
                        cancel: function () {
                            // 继续留在当前页面，啥也不做
                        }
                    });


                    // 需要显式的返回 false，来阻止执行返回的脚本
                    return false;
                }

            });

            F.alert('拦截函数注册成功！');
        }

    </script>
</body>
</html>
