using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.test
{
    public partial class empty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ddlTest.SelectedValue = "2";

                //testLit.Text = "<link href=\"/extjs/res/ext-theme-neptune/all.css\" rel=\"stylesheet\" type=\"text/css\"/>";
            }

        }

        //protected void ddlTest_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        //protected void toggleDdl_Click(object sender, EventArgs e)
        //{
        //    this.ddlTest.Enabled = !this.ddlTest.Enabled;

        //}

        //protected string GetSSS()
        //{
        //    return "haha";
        //}
    }
}