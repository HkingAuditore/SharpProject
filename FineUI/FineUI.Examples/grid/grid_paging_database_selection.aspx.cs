using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace FineUI.Examples.grid
{
    public partial class grid_paging_database_selection : PageBase
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

        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            SyncSelectedRowIDArrayToHiddenField();

            labResult.Text = "选中行的ID列表为：" + hfSelectedIDS.Text.Trim();
        }


        protected void Grid1_PageIndexChange(object sender, GridPageEventArgs e)
        {
            SyncSelectedRowIDArrayToHiddenField();

            BindGrid();

            UpdateSelectedRowIDArray();
        }

        private List<string> GetSelectedRowIDArrayFromHiddenField()
        {
            JArray idsArray = new JArray();

            string currentIDS = hfSelectedIDS.Text.Trim();
            if (!String.IsNullOrEmpty(currentIDS))
            {
                idsArray = JArray.Parse(currentIDS);
            }
            else
            {
                idsArray = new JArray();
            }
            return new List<string>(idsArray.ToObject<string[]>());
        }

        private void SyncSelectedRowIDArrayToHiddenField()
        {
            List<string> ids = GetSelectedRowIDArrayFromHiddenField();

            List<string> selectedRowIDs = new List<string>(Grid1.SelectedRowIDArray);
            foreach (GridRow row in Grid1.Rows)
            {
                string rowID = row.RowID;
                if (selectedRowIDs.Contains(rowID))
                {
                    if (!ids.Contains(rowID))
                    {
                        ids.Add(rowID);
                    }
                }
                else
                {
                    if (ids.Contains(rowID))
                    {
                        ids.Remove(rowID);
                    }
                }
            }


            hfSelectedIDS.Text = new JArray(ids).ToString(Formatting.None);
        }

        private void UpdateSelectedRowIDArray()
        {
            List<string> ids = GetSelectedRowIDArrayFromHiddenField();

            List<string> selectedRowIDs = new List<string>();
            foreach (GridRow row in Grid1.Rows)
            {
                if (ids.Contains(row.RowID))
                {
                    selectedRowIDs.Add(row.RowID);
                }
            }

            Grid1.SelectedRowIDArray = selectedRowIDs.ToArray();
        }
        #endregion

    }
}
