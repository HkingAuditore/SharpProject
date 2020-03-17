using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace FineUI.Examples.grid
{
    public partial class grid_rowcommand_download : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        #region LoadData

        private void LoadData()
        {
            BindGrid();
        }

        private void BindGrid()
        {
            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        #endregion

        #region Events

        protected void Button1_Click(object sender, EventArgs e)
        {
            labResult.Text = HowManyRowsAreSelected(Grid1);
        }

        protected void Grid1_RowCommand(object sender, GridCommandEventArgs e)
        {
            object[] keys = Grid1.DataKeys[e.RowIndex];
            string result = String.Format("你点击了第 {0} 行，第 {1} 列，行命令是 {2}", e.RowIndex + 1, e.ColumnIndex + 1, e.CommandName) +
                       "<br>" +
                       String.Format("当前行数据 - 编号：{0}，姓名：{1}", keys[0], keys[1]);

            if (e.CommandName == "Action1")
            {
                // AJAX回发
                labResult.Text = result;
            }
            else if (e.CommandName == "Action2")
            {
                result = result.Replace("<br>", "\r\n");

                // 非AJAX回发
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment; filename=row_" + e.RowIndex + ".txt");
                Response.ContentType = "text/plain";
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.Write(result);
                Response.End();
            }
        }

        #endregion
    }
}
