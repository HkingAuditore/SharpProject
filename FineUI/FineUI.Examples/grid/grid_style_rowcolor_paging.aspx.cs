using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Examples.data
{
    public partial class grid_style_rowcolor_paging : PageBase
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
            DataTable table = DataSourceUtil.GetDataTable2();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Event

        protected void Grid1_RowDataBound(object sender, GridRowEventArgs e)
        {
            // e.DataItem  -> System.Data.DataRowView or custom class.
            // e.RowIndex -> Current row index.
            // e.Values -> Rendered html for each column of this row.
            
            DataRowView row = e.DataItem as DataRowView;
            if (row != null)
            {
                //e.Values[1] = String.Format("Bound - {0}", row["MyValue"]);
                int entranceYear = Convert.ToInt32(row["EntranceYear"]);

                if (entranceYear >= 2006)
                {
                    highlightRows.Text += e.RowIndex.ToString() + ",";
                }
            }
        }



        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            currentPageIndex.Text = e.NewPageIndex.ToString();

            //Grid1.PageIndex = e.NewPageIndex;
        }

        #endregion

    }
}
