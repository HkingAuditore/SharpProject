using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.grid
{
    public partial class grid_newtab_hiderefresh_window : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();

                string paramName = Request.QueryString["name"];
                if (!String.IsNullOrEmpty(paramName))
                {
                    labUserName.Text = paramName;
                }
            }

        }

        private void LoadData()
        {
            btnClose.OnClientClick = "parent.removeActiveTab();";
            btnCloseRefresh.OnClientClick = String.Format("parent.activeTabAndRefresh('{0}');", Request.QueryString["parenttabid"]);
        }



    }
}
