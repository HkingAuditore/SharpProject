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
    public partial class grid_style_rowcolor_paging_database : PageBase
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
            // 1.设置总项数（特别注意：数据库分页一定要设置总记录数RecordCount）
            Grid1.RecordCount = GetTotalCount();

            // 2.获取当前分页数据
            DataTable table = GetPagedDataTable(Grid1.PageIndex, Grid1.PageSize);

            // 3.绑定到Grid
            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        /// <summary>
        /// 模拟返回总项数
        /// </summary>
        /// <returns></returns>
        private int GetTotalCount()
        {
            return DataSourceUtil.GetDataTable2().Rows.Count;
        }

        /// <summary>
        /// 模拟数据库分页
        /// </summary>
        /// <returns></returns>
        private DataTable GetPagedDataTable(int pageIndex, int pageSize)
        {
            DataTable source = DataSourceUtil.GetDataTable2();

            DataTable paged = source.Clone();

            int rowbegin = pageIndex * pageSize;
            int rowend = (pageIndex + 1) * pageSize;
            if (rowend > source.Rows.Count)
            {
                rowend = source.Rows.Count;
            }

            for (int i = rowbegin; i < rowend; i++)
            {
                paged.ImportRow(source.Rows[i]);
            }

            return paged;
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
            highlightRows.Text = "";

            //Grid1.PageIndex = e.NewPageIndex;

            BindGrid();
        }

        #endregion

    }
}
