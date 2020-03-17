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
    public partial class grid_many_columns : PageBase
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

            for (int i = 0; i < 2; i++)
            {
                table.Merge(DataSourceUtil.GetDataTable(), true);
            }
            
            Grid1.DataSource = table;
            Grid1.DataBind();

        }

        protected string GetHobby(object hobbyObj)
        {
            List<string> hobbyList = new List<string>();
            // Hobby：reading,basketball,travel,movie,music
            // 爱好：读书, 篮球, 旅游, 电影, 音乐 
            string[] hobbies = hobbyObj.ToString().ToLower().Split(',');

            foreach (string hobby in hobbies)
            {
                if (hobby == "reading")
                {
                    hobbyList.Add("读书");
                }
                else if (hobby == "basketball")
                {
                    hobbyList.Add("篮球");
                }
                else if (hobby == "travel")
                {
                    hobbyList.Add("旅游");
                }
                else if (hobby == "movie")
                {
                    hobbyList.Add("电影");
                }
                else if (hobby == "music")
                {
                    hobbyList.Add("音乐");
                }
            }

            return String.Join(",", hobbyList.ToArray());
        }

        #endregion



    }
}
