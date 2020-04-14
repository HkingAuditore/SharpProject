using System;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using FineUI.Examples.Lab.Controllers;
using FineUI.Examples.Lab.Modules.Base;

namespace WebSharp
{
    public partial class Register : Page
    {

        #region 数据

        private Weapon[] _weapons = new[]
        {
            Weapon.DoubleActionRevolver,
            Weapon.SchofieldRevolver,
            Weapon.M1899Pistol,
            Weapon.MauserPistol,
            Weapon.SpringfieldRifle,
            Weapon.LancasterRepeater,
            Weapon.CarcanoRifle,
            Weapon.DoubleBarreledShotgun,
            Weapon.SawedOffShotgun
        };

        private Home[] _homes = new[]
        {
            Home.SaintDenis,
            Home.Rhodes,
            Home.Valentine,
            Home.BlackWater,
            Home.Strawberry,
            Home.BeecherSHope,
            Home.TheHeartLand
        };

        /// <summary>
        /// 最多允许出错次数
        /// </summary>
        private const int Time = 3;

        #endregion


        #region 处理与检测

        /// <summary>
        /// 检查输入
        /// </summary>
        private void CheckInput()
        {
            if (!Male.Checked && !Female.Checked)
            {
                RegisterErrorException e = new RegisterErrorException("未选择性别！");
                throw e;
            }
            if (UserAccount.Text == "" || FineUI.Examples.Lab.Modules.User.FindUser(UserAccount.Text) != null)
            {
                RegisterErrorException e = new RegisterErrorException("未填写账号或账号已被占用！");
                throw e;

            }
            if (UserEmail.Text == "")
            {
                RegisterErrorException e = new RegisterErrorException("未填写邮箱！");
                throw e;

            }
            if (UserPassword.Text == "")
            {
                RegisterErrorException e = new RegisterErrorException("未填写密码！");
                throw e;

            }
            if (UserPasswordConfirm.Text != UserPassword.Text)
            {
                RegisterErrorException e = new RegisterErrorException("两次密码不一致！");
                throw e;

            }
            if (UserName.Text == "")
            {
                RegisterErrorException e = new RegisterErrorException("未填写用户名！");
                throw e;

            }

            if (GetUserWeapon() == 0)
            {
                RegisterErrorException e = new RegisterErrorException("请至少选择一个武器！");
                throw e;

            }
            if (!File.Exists(Server.MapPath("../../Users/Avatars/" + UserAccount.Text + ".jpg")))
            {
                RegisterErrorException e = new RegisterErrorException("请上传头像！");
                throw e;

            }
            //验证码检验
            if (!txtCaptcha.Text.Equals(Session["code"]))
            {
                RegisterErrorException e = new RegisterErrorException("验证码错误！");
                throw e;
            }
        }

        /// <summary>
        /// 获取选择武器
        /// </summary>
        /// <returns></returns>
        private Weapon GetUserWeapon()
        {
            Weapon userWeapon = 0x00;
            int radioCount = 0;
            // 遍历所有控件
            foreach (Control controller in form1.Controls)
            {
                // 选择所有的CheckBox
                if (string.Equals(controller.GetType().ToString(), "System.Web.UI.WebControls.CheckBox"))
                {
                    CheckBox weaponBox = (CheckBox) controller;
                    if (weaponBox.Checked)
                    {
                        userWeapon |= _weapons[radioCount];
                    }

                    radioCount++;
                }
            }

            return userWeapon;
        }

        /// <summary>
        /// 获取选择的出生地
        /// </summary>
        /// <returns></returns>
        private Home GetUserHome() => _homes[UserHome.SelectedIndex];

        /// <summary>
        /// 检测图片格式
        /// </summary>
        /// <param name="fileType">文件名</param>
        /// <param name="allowType">允许的文件格式</param>
        private bool CheckImgType(string fileName, string allowType)
        {
            fileName = fileName.Split('.')[1];
            if (fileName.ToLower() != allowType)
            {
                Response.Write("<script>alert('请上传"+allowType+"格式图像！')</script>");
                return false;
            }

            return true;
        }

        #endregion


        #region 页面交互

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) //首次登录时为false
            {
                Session["Time"] = "1";
            }
            else if (Int32.Parse(Session["Time"].ToString()) >= Time)
            {
                Confirm.Enabled = false;
                Confirm.CssClass = "btn-alert";
            }
        }

        // 头像上传
        protected void Upload_Click(object sender, EventArgs e)
        {
            string pwd = UserPassword.Text;
            string pwdConfirm = UserPasswordConfirm.Text;
            if (FileUpload1.HasFile)
            {
                StringBuilder imgPath = new StringBuilder(Server.MapPath("../../Users/Avatars/"));
                // 只允许jpg格式
                if(!CheckImgType(FileUpload1.FileName, "jpg"))return;
                
                // 判断是否已经建立头像库文件夹，如果没有则新建（这段可以省略，不过最好留着保证移植的安全）
                if (!Directory.Exists(imgPath.ToString())) Directory.CreateDirectory(imgPath.ToString());

                // 判断是否已经有此用户或是否输入账号
                if (UserAccount.Text != "" && FineUI.Examples.Lab.Modules.User.FindUser(UserAccount.Text) == null)
                {
                    // 保存文件
                    imgPath.Append(UserAccount.Text + '.' + "jpg");
                    FileUpload1.SaveAs(imgPath.ToString());
                    Image1.ImageUrl = "../Data/Users/Avatars/" + UserAccount.Text + '.' + "jpg";
                }
                else
                {
                    // 错误检测
                    if (UserAccount.Text == "") Response.Write("<script>alert('未填写账号！')</script>");
                    if (FineUI.Examples.Lab.Modules.User.FindUser(UserAccount.Text) != null)
                    {
                        Response.Write("<script>alert('账号已被占用！')</script>");
                    }
                    return;
                }

            }

            // 防止发回后输入清空
            UserPassword.Text = pwd;
            UserPasswordConfirm.Text = pwdConfirm;
        }

        protected void Confirm_OnClick(object sender, EventArgs e)
        {
            try
            {
                CheckInput();
                Gender userGender = Male.Checked ? Gender.Male : Gender.Female;
                // 初始化注册管理器，往用户数据字典中输入注册用户
                RegisterController registerController = new RegisterController(UserAccount.Text,UserName.Text, userGender,UserPassword.Text,GetUserWeapon(),GetUserHome(),UserEmail.Text,UserMail.Text,UserPhone.Text);
                Session["userID"] = UserAccount.Text;
                Response.Redirect("index.aspx");
            }
            catch (Exception et)
            {
                Response.Write("<script>alert('"+et.Message+"')</script>");
                Response.Write($"<script>alert('这是第{Session["Time"]}次错误！')</script>");
                Session["Time"] = Int32.Parse(Session["Time"].ToString()) + 1;
            }
        }

        protected void UserEmail_OnTextChanged(object sender, EventArgs e)
        {
            if (!RegisterController.CheckEmail(UserEmail.Text))
            {
                Response.Write("<script>alert('邮箱无效！')</script>");
                UserEmail.Text = "";
            }
        }

        protected void UserPhone_OnTextChanged(object sender, EventArgs e)
        {
            if (!RegisterController.CheckPhone(UserPhone.Text))
            {
                Response.Write("<script>alert('手机号码无效！')</script>");
                UserPhone.Text = "";
            }

        }

        protected void UserMail_OnTextChanged(object sender, EventArgs e)
        {
            if (!RegisterController.CheckMail(UserMail.Text))
            {
                Response.Write("<script>alert('邮编无效！')</script>");
                UserMail.Text = "";
            }

        }

        #endregion
    }
}