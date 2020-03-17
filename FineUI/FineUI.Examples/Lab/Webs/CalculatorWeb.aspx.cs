using System;
using System.Text;
using System.Web.UI;
using FineUI.Examples.Lab.Modules.Base;

namespace FineUI.Examples.Lab.Webs
{
    public partial class CalculatorWeb : System.Web.UI.Page
    {

        #region 交互控制

        protected void Page_Load(object sender, EventArgs e)
        {
            // 在回发页面解方程
            if (IsPostBack)
            {
                SolveEquation(num0,num1,num2);
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (num0.Text == "0" && num1.Text == "0")
            {
                // 调用前台JS
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", "alert('x的系数不可以全部为0！')", true);
            }
            else
            {
                SolveEquation(num0, num1, num2);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            num0.Text = "";
            num1.Text = "";
            num2.Text = "";
            Result.Visible = false;
        }

        #endregion

        /// <summary>
        /// 显示解方程结果
        /// </summary>
        /// <param name="equation">解好的方程</param>
        private void UpdateResult(Equation equation)
        {
            var stringBuilder = new StringBuilder(equation.EquautionString + " 解有 " + equation.Result.Count + " 个， 是： ");
            foreach (var i in equation.Result)
            {
                stringBuilder.Append(i + ",");
            }
            stringBuilder.Remove(stringBuilder.Length - 1, 1);
            Result.Visible = true;
            Result.Text = stringBuilder.ToString();
        }

        /// <summary>
        /// 解二次方程
        /// </summary>
        /// <param name="textBox0">二次系数输入框</param>
        /// <param name="textBox1">一次系数输入框</param>
        /// <param name="textBox2">常数输入框</param>
        private void SolveEquation(FineUI.TextBox textBox0, FineUI.TextBox textBox1, FineUI.TextBox textBox2)
        {
            try
            {
                Equation equation;
                if (textBox0.Text == "0")
                {
                    // 一次方程
                    equation = new OneDegreeEquation(float.Parse(textBox2.Text), float.Parse(textBox1.Text));
                }
                else
                {
                    //二次方程
                    equation = new TwoDegreeEquation(float.Parse(textBox2.Text), float.Parse(textBox1.Text), float.Parse(textBox0.Text));
                }
                UpdateResult(equation);
            }
            catch (Exception et)
            {
                Result.Visible = true;
                Result.Text = et.Message;
            }
        }


    }
}