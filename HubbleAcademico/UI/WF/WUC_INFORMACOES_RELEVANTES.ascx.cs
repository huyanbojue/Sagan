using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HubbleAcademico.UI.WF
{
    public partial class WUC_INFORMACOES_RELEVANTES : System.Web.UI.UserControl
    {
       public void Inicial()
        {
            CarregarInformacoes();
        }
        private void CarregarInformacoes()
        {
            lit_totalFaltas.Text = Convert.ToString(new Sessao().Dados().TotalFatas);
            lit_totalPermitido.Text = Convert.ToString(new Sessao().Dados().TotalFaltasPErmitidas);
            lit_aulasMinistradas.Text = Convert.ToString(new Sessao().Dados().AulasMinistradas);
            lit_aulasPrevistas.Text = Convert.ToString(new Sessao().Dados().AulasPrevistas);
        }
    }
}