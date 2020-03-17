using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.window
{
    public partial class window_form : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }


        protected void btnClose_Click(object sender, EventArgs e)
        {
            Window2.Hidden = true;
        }


        protected void btnSubmitForm1_Click(object sender, EventArgs e)
        {

        }


    }
}
