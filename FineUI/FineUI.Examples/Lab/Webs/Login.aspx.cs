using System;
using System.Text;
using FineUI.Examples.Lab.Controllers;

namespace WebSharp
{
    public partial class Login : System.Web.UI.Page
    {
        #region 数据

        // 允许失败次数
        private const int Time = 3;
        private StringBuilder _loginInfo  = new StringBuilder("登录时间：");

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) //首次登录时为false
            {
                Session["Time"] = "1";
            }else if (Int32.Parse(Session["Time"].ToString()) >= Time)
            {
                Confirm.Enabled = false;
                Confirm.CssClass = "btn-alert";
            }

        }

        protected void Confirm_OnClick(object sender, EventArgs e)
        {
            
            //验证码检验
            if (!txtCaptcha.Text.Equals(Session["code"]))
            {
                Response.Write("<script>alert('验证码错误！')</script>");
                return;
            }

            // 用LoginController进行登录检验
            try
            {
                //订阅登录结果分支事件
                LoginController.LoginSuccess += LoginSuccess;
                LoginController.LoginFailure += LoginFailure;
                var login = new LoginController(UserID.Text, UserPassword.Text);
            }
            catch (LoginErrorException et)
            {
                if (et.Message == "密码错误！")
                {
                    Response.Write($"<script>alert('密码错误！这是第{Session["Time"]}次错误！')</script>");
                    Session["Time"] = Int32.Parse(Session["Time"].ToString()) + 1;
                    UserPassword.Focus();

                }
            }
            
        }

        /// <summary>
        /// 登录成功
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void LoginSuccess(object source, LoginArgs e)
        {
            Session["userID"] = e.UserCorrespond.UserID;
            // 记录用户的登录时间
            // Session["userLoginTime"] = DateTime.Now.ToString();
            // _loginInfo.Append(Session["userLoginTime"]);
            Response.Redirect("index.aspx");
        }

        /// <summary>
        /// 登录失败
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        private void LoginFailure(object source, LoginArgs e)
        {
            
        }
    }
}