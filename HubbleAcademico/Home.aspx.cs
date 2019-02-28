using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HubbleAcademico
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (! DesignMode)
            {
                if (! new Sessao().Existe())
                {
                    Response.Redirect("Default.aspx? SEM PERMISSAO");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (! IsPostBack)
            {
                WUC_INFORMACOES_RELEVANTES.Inicial();
                WUC_PROGRESSO_DISCIPLINAS.Inicial();
                WUC_GRAFICOS_AREAS_CONHECIMENTO.Inicial();
                WUC_INFORMACOES_RELEVANTES.Visible = true;
                WUC_PROGRESSO_DISCIPLINAS.Visible = false;
                WUC_GRAFICOS_AREAS_CONHECIMENTO.Visible = false;
            }
        }
    }
}