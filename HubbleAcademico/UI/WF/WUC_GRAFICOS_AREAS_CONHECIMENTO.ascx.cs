using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HubbleAcademico.UI.WF
{
    public partial class WUC_GRAFICOS_AREAS_CONHECIMENTO : System.Web.UI.UserControl
    {
        public void Inicial()
        {

        }
        private void CarregarGraficosSetores()
        {
            decimal totalExatas = 0;
            decimal totalHumenas = 0;

            foreach (var nota in new Sessao().Dados().NotasList)
            {
                switch (nota.NomeMateria)
                {
                    case "História":
                        SomarMedias(nota, ref totalHumenas);
                        break;
                    case "Filosofia":
                        SomarMedias(nota, ref totalHumenas);
                        break;
                    case "Sociologia":
                        SomarMedias(nota, ref totalHumenas);
                        break;
                    case "Língua Portuguesa":
                        SomarMedias(nota, ref totalHumenas);
                        break;
                    case "Matemática":
                        SomarMedias(nota, ref totalExatas);
                        break;
                    case "Química":
                        SomarMedias(nota, ref totalExatas);
                        break;
                    case "Física":
                        SomarMedias(nota, ref totalExatas);
                        break;
                    case "Biologia":
                        SomarMedias(nota, ref totalExatas);
                        break;
                    default:
                        continue;
                }
            }
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "scriptGraficoSetor", "CarregarPizza(" + totalExatas + "," + totalHumenas + ");", true);


        }
        private void SomarMedias(Notas nota, ref decimal soma)
        {
            soma += nota.ValorBimestre1;
            soma += nota.ValorBimestre2;
            soma += nota.ValorBimestre3;
            soma += nota.ValorBimestre4;
        }
    }
}