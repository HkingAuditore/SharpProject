using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Examples.toolbar
{
    public partial class formfields : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        #region BindGrid

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Events

        protected void btnClearDate_Click(object sender, EventArgs e)
        {
            dpStartDate.Reset();
            dpEndDate.Reset();

            Grid1.DataSource = null;
            Grid1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // 根据查询条件进行表格绑定

            BindGrid();
        }

        #endregion

    }
}
