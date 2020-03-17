﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Examples.grid
{
    public partial class grid_checkall_only : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
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

        #region Event

        /// <summary>
        /// 选中了哪些行
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            int[] selections = Grid1.SelectedRowIndexArray;
            foreach (int rowIndex in selections)
            {
               sb.AppendFormat("行号:{0} 用户名:{1}<br />", rowIndex + 1, Grid1.DataKeys[rowIndex][1]);
            }
            labResult.Text = sb.ToString();

            //labResult.Text = HowManyRowsAreSelected(Grid1);
        }

        #endregion

    }
}
