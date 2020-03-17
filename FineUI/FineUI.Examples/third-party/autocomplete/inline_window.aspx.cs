using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.autocomplete
{
    public partial class inline_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = String.Format("输入值：{0}", TextBox1.Text);
        }


    }
}
