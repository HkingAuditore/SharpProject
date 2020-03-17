using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FineUI.Examples.master
{
    public partial class simple : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 每次页面加载（包括回发），都要进行设置
            ((Simple)Master).ProcessLeftTreeNodeClick = ProcessLeftTreeNodeClick;

            if (!IsPostBack)
            {
                
            }
        }

        public void ProcessLeftTreeNodeClick(string treeNodeId, string treeNodeText)
        {
            labResult.Text = "你点击了母版页中的树节点：" + treeNodeText;
        }
    }
}