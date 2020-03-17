using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.grid
{
    public partial class grid_newtab_hideupdate_window : PageBase
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
            //btnCloseRefresh.OnClientClick = "parent.removeActiveTab();parent.activeTabAndRefresh('" + Request.QueryString["parenttabid"] + "')";
        }

        protected void btnCloseRefresh_Click(object sender, EventArgs e)
        {
            Alert.Show("保存成功！", String.Empty, Alert.DefaultMessageBoxIcon,
                "parent.activeTabAndUpdate('" + Request.QueryString["parenttabid"] + "', '" + DatePicker1.Text + "');");

        }



    }
}
