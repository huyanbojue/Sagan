using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HubbleAcademico.UI.WUC
{
    public partial class WUC_MENU_LATERAL : System.Web.UI.UserControl
    {
        public void Inicial()
        {
            if (new Sessao().Existe())
            {
                pnl_usuarioLogado.Visible = true;
                pnl_usuarioNaoLogado.Visible = false;
            }
            else
            {
                pnl_usuarioLogado.Visible = false;
                pnl_usuarioNaoLogado.Visible = true;
            }
        }
    }
}