using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;

namespace FineUI.Examples.grid
{
    public partial class grid_edit_cart : PageBase
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
            DataTable table = GetCartDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();

			Grid1.SelectedRowIndexArray = new int[] { 0, 1 };
        }


        #endregion

        #region Events

        protected void btnGotoPay_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<ol>");
            foreach(int rowIndex in Grid1.SelectedRowIndexArray) {
                System.Web.UI.WebControls.TextBox tbxNumber = (System.Web.UI.WebControls.TextBox)Grid1.Rows[rowIndex].FindControl("tbxNumber");

                sb.AppendFormat("<li>{0}（{1}）</li>", Grid1.DataKeys[rowIndex][2], tbxNumber.Text);
            }
            sb.Append("</ol><hr/>");

            sb.AppendFormat("共 {0} 件商品，总计 ¥{1}", Request.Form["TOTAL_NUMBER"], Request.Form["TOTAL_PRICE"]);

            Alert.Show(sb.ToString(), MessageBoxIcon.Information);
        }

        

        #endregion

        #region Data

         /// <summary>
        /// 获取模拟表格
        /// </summary>
        /// <returns></returns>
        protected DataTable GetCartDataTable()
        {
            DataTable table = new DataTable();
            table.Columns.Add(new DataColumn("Id", typeof(int)));
            table.Columns.Add(new DataColumn("Code", typeof(String)));
            table.Columns.Add(new DataColumn("Name", typeof(String)));
            table.Columns.Add(new DataColumn("Desc", typeof(String)));
            table.Columns.Add(new DataColumn("Price", typeof(float)));
            table.Columns.Add(new DataColumn("Number", typeof(int)));
            
            DataRow row = table.NewRow();
            row[0] = 101;
            row[1] = "100022";
            row[2] = "商品一";
            row[3] = "这是商品一的介绍，巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉，巴拉巴拉，巴拉巴拉巴拉巴拉巴拉。";
            row[4] = 35.5;
            row[5] = 1;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 102;
            row[1] = "100023";
            row[2] = "商品二";
            row[3] = "这是商品二的介绍，巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉，巴拉巴拉，巴拉巴拉巴拉巴拉巴拉。";
            row[4] = 18.99;
            row[5] = 2;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 103;
            row[1] = "100024";
            row[2] = "商品三";
            row[3] = "这是商品三的介绍，巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉，巴拉巴拉，巴拉巴拉巴拉巴拉巴拉。";
            row[4] = 18.99;
            row[5] = 2;
            table.Rows.Add(row);

            row = table.NewRow();
            row[0] = 104;
            row[1] = "100025";
            row[2] = "商品四";
            row[3] = "这是商品四的介绍，巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉巴拉巴拉，巴拉巴拉巴拉巴拉，巴拉巴拉，巴拉巴拉巴拉巴拉巴拉。";
            row[4] = 22.00;
            row[5] = 1;
            table.Rows.Add(row);

            return table;
        }

        protected string GetXiaoji(object priceobj, object numberobj)
        {
            float price = Convert.ToSingle(priceobj);
            int number = Convert.ToInt32(numberobj);

            return String.Format("{0:F}", price * number);
        }

        #endregion

    }
}
