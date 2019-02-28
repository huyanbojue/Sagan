using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HubbleAcademico
{
    public partial class Teste : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    int[][] medias = new int[20][];
        //    for (int i = 0; i < 4; i++)
        //    {
        //        for (int j = 0; j < 4; j++)
        //        {
        //            arr[i, j] = j;
        //        }
        //    }

        //    rpt.DataSource = arr;
        //    rpt.DataBind();
        //}
        protected void btn_click(object sender,EventArgs e)
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Script", "Dados("+60+","+20+");", true);
            for (long i= 0;i<=2000000000000000000;i++)
            {
                var a = 0;
            }
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Script", "SairModal();", true);

        }

        //protected void Bound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        Literal litNomeMateria = (Literal)e.Item.FindControl("litTeste");
        //        litNomeMateria.Text = DataBinder.Eval(e.Item.DataItem, "");
        //    }
        //}
    }
}