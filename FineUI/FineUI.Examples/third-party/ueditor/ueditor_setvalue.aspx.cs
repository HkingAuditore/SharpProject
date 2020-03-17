using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.aspnet
{
    public partial class ueditor_setvalue : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //// 页面初始化时，编辑器还没有初始化，所以不能直接调用updateEditor
                //PageContext.RegisterStartupScript(String.Format("updateEditor('{0}');", "这是初始值！"));

                hfEditorInitValue.Text = "这是<strong>初始值</strong>！";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string editorContent = Request.Form["Editor1"];
            if (String.IsNullOrEmpty(editorContent))
            {
                Alert.ShowInTop("编辑器内容为空！");
            }
            else
            {
                Alert.ShowInTop(HttpUtility.HtmlEncode(editorContent));
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string content = "<p><strong>FineUI</strong> - 基于 ExtJS 的开源 ASP.NET 控件库。</p>";

            PageContext.RegisterStartupScript(String.Format("updateEditor({0});", JsHelper.Enquote(content)));
        }





    }
}
