using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.iframe
{
    public partial class vbox_formgrid : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AutoBindGrid();
            }
        }

        #region BindGrid

        private void AutoBindGrid()
        {
            if (ViewState["BindGrid1"] != null && Convert.ToBoolean(ViewState["BindGrid1"]))
            {
                BindGrid();
                ViewState["BindGrid1"] = false;
            }
            else
            {
                BindGrid2();
                ViewState["BindGrid1"] = true;
            }
        }

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid2.DataSource = table;
            Grid2.DataBind();
        }

        private void BindGrid2()
        {
            DataTable table = DataSourceUtil.GetDataTable2();

            Grid2.DataSource = table;
            Grid2.DataBind();
        }

        #endregion


        protected void Grid2_PageIndexChange(object sender, GridPageEventArgs e)
        {
            Alert.Show(e.NewPageIndex.ToString());
        }


    }
}
