using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace HubbleAcademico.UI.WF
{
    public partial class WUC_PROGRESSO_DISCIPLINAS : System.Web.UI.UserControl
    {
        public void Inicial()
        {
            CarregarProgressoMaterias();
        }
        public string CarregarProgressoMaterias()
        {
            StringBuilder str = new StringBuilder();
            foreach (Notas nota in new Sessao().Dados().NotasList)
            {
                decimal porcentagemAprovacao = Math.Round((GetPorcentagemAprovacao(nota.ValorBimestre1, nota.ValorBimestre2, nota.ValorBimestre3, nota.ValorBimestre4)), 1);
                decimal notaRestante = Math.Round((GetMediaRestante(nota.ValorBimestre1, nota.ValorBimestre2, nota.ValorBimestre3, nota.ValorBimestre4, nota.QtdNotasLancadas)), 2);
                Session["notaRestante"] = notaRestante;
                str
                    .Append(string.Concat(
                        "<div class=", "'divProgresso mb-5'>",
                                "<h5 class=", "'bg-dark text-white text-center m-0 p-1 position-relative'>" + nota.NomeMateria + "<p class", "'position-absolute p-4 r-0 m-0'>" + notaRestante + "</p>" + "</h5>",
                                 "<div class=", "progress", ">",
                                        "<div class=", "'progress-bar progress-bar-striped progress-bar-animated bg-success'", " role=", "progressbar", " aria-valuenow=", "75", " aria-valuemin=", "0", " aria-valuemax=", "100", " style=", "width:", +Math.Floor(porcentagemAprovacao) + "%", " >", "", Math.Round(porcentagemAprovacao), "%</div>",
                                 "</div>",
                       "</div>"
                        ));

            }
            return str.ToString();
        }

        private decimal GetPorcentagemAprovacao(decimal b1, decimal b2, decimal b3, decimal b4)
        {
            decimal porcentagem = 0;
            porcentagem = (((b1 * 2) / 60) + ((b2 * 2) / 60) + ((b3 * 3) / 60) + ((b4 * 3) / 60)) * 100;
            if (porcentagem >= 100)
            {
                return 100;
            }
            else
            {
                return porcentagem;
            }

        }

        private decimal GetMediaRestante(decimal b1, decimal b2, decimal b3, decimal b4, int qtdNotasLancadas)
        {
            decimal mediaRestante = 0;

            switch (qtdNotasLancadas)
            {
                case 0:
                    mediaRestante = 0;
                    break;

                case 1:
                    mediaRestante = ((60 - (b1 * 2)) / 8) * 3;
                    break;

                case 2:
                    mediaRestante = ((60 - ((b1 * 2) + (b2 * 2))) / 6) * 2;
                    break;
                case 3:
                    mediaRestante = ((60 - ((b1 * 2) + (b2 * 2) + (b3 * 3))) / 3);

                    break;
                case 4:
                    mediaRestante = 0;
                    break;
                default:
                    mediaRestante = 0;
                    break;
            }
            if (mediaRestante <= 0)
            {
                return 0;
            }
            else
            {
                return mediaRestante;
            }



        }
    }
}