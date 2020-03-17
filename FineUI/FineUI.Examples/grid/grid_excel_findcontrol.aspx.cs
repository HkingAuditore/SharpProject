using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.IO;
using AspNet = System.Web.UI.WebControls;

namespace FineUI.Examples.data
{
    public partial class grid_excel_findcontrol : PageBase
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
            ViewState["UseDataSource1"] = true;

            DataTable table = DataSourceUtil.GetDataTable();

            Grid1.DataSource = table;
            Grid1.DataBind();
        }

        #endregion

        #region Events

        protected void Button2_Click(object sender, EventArgs e)
        {
            DataTable table;
            if (Convert.ToBoolean(ViewState["UseDataSource1"]))
            {
                ViewState["UseDataSource1"] = false;
                table = DataSourceUtil.GetDataTable2();
            }
            else
            {
                ViewState["UseDataSource1"] = true;
                table = DataSourceUtil.GetDataTable();
            }

            Grid1.DataSource = table;
            Grid1.DataBind();
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment; filename=myexcel.xls");
            Response.ContentType = "application/excel";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.Write(GetGridTableHtml(Grid1));
            Response.End();
        }

        private string GetGridTableHtml(Grid grid)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append("<meta http-equiv=\"content-type\" content=\"application/excel; charset=UTF-8\"/>");


            sb.Append("<table cellspacing=\"0\" rules=\"all\" border=\"1\" style=\"border-collapse:collapse;\">");

            sb.Append("<tr>");
            foreach (GridColumn column in grid.Columns)
            {
                sb.AppendFormat("<td>{0}</td>", column.HeaderText);
            }
            sb.Append("</tr>");


            foreach (GridRow row in grid.Rows)
            {
                sb.Append("<tr>");

                foreach (GridColumn column in grid.Columns)
                {
                    string html = row.Values[column.ColumnIndex].ToString();

                    if (column.ColumnID == "tfNumber")
                    {
                        html = (row.FindControl("labNumber") as AspNet.Label).Text;
                    }
                    else if (column.ColumnID == "tfGender")
                    {
                        html = (row.FindControl("labGender") as AspNet.Label).Text;
                    }
                    else if (column.ColumnID == "cbfAtSchool")
                    {
                        if (html.Contains("checked"))
                        {
                            html = "是";
                        }
                        else
                        {
                            html = "否";
                        }
                    }
                    else if (column.ColumnID == "ifGroup")
                    {
                        string prefix = Request.Url.AbsoluteUri.Replace(Request.Url.AbsolutePath, "");
                        html = html.Replace("src=\"", "src=\"" + prefix);
                    }


                    sb.AppendFormat("<td>{0}</td>", html);
                }

                sb.Append("</tr>");
            }

            sb.Append("</table>");

            return sb.ToString();
        }


        #endregion

    }
}
