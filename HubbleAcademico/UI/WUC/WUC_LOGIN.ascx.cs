using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using System.Diagnostics;
using System.Timers;
using System.Text;
using System.Threading;
using System.Data;
namespace HubbleAcademico.UI.WUC
{
    public partial class WUC_LOGIN : System.Web.UI.UserControl
    {
        #region Atributos
        private int totalFaltas;
        private int totalAulasPrevistas;
        private int contProcessosDriver;
        public Usuario usuario = new Usuario(new Conexao());
        public QAcademico sistema = new QAcademico(new Conexao());
        public IWebDriver driver;

        #endregion

        #region GET/SET
        public int TotalFaltas { get => totalFaltas; set => totalFaltas = value; }
        public int TotalAulasPrevistas { get => totalAulasPrevistas; set => totalAulasPrevistas = value; }
        public int ContProcessosDriver { get => contProcessosDriver; set => contProcessosDriver = value; }
        #endregion

        public void Inicial()
        {
            WUC_MENU_LATERAL.Inicial();
            WUC_NAV.Inicial();
        }
        public void bnt_logar_Click(object sender, EventArgs e)
        {
            usuario.LoginSistema = txt_usuario.Text;
            usuario.SenhaSistema = txt_senha.Text;
            usuario.RetriveAutenticacao();
            if (usuario.Found)
            {
                //driver = new ChromeDriver("C:/WWW/Hubble/bin");
                sistema.IdSistema = 1;
                sistema.Retrieve();
                //LogarQAcademico();
                //GoBoletim();
                usuario.TotalFatas = 191;/*GetFaltas();*/
                usuario.NotasList = new List<Notas>(new[] { new Notas("Português", 10, 8, 7, 8, 4) });/*GetNotas();*/
                //GoDiario();
                usuario.AulasMinistradas = 301;/*GetAulasMinistradas();*/
                usuario.AulasPrevistas = 1090;/*GetTotalAulasPrevistas();*/
                usuario.TotalFaltasPErmitidas = 199; ;/*CalculaTotalFaltasPermitida();*/
                CarregarSessao();
                //EncerrarSessaoQacademico();
                //driver.Close();
                //MatarProcessoChrome();
                Response.Redirect("Home.aspx");
            }
            else
            {
                ExibirAlerta("error", "Usuário ou senha são inválidos!");
                FecharModal();
            }
        }
        private void LogarQAcademico()
        {
            driver.Navigate().GoToUrl(sistema.UrlSistema);
            driver.FindElement(By.XPath(sistema.XPathLinkAlunos)).Click();
            driver.FindElement(By.XPath(sistema.XPathLogin)).SendKeys(usuario.LoginAcademico);
            driver.FindElement(By.XPath(sistema.XPathSenha)).SendKeys(usuario.SenhaAcademico);
            driver.FindElement(By.XPath(sistema.XPathBtnLogar)).Click();
        }

        public void GoBoletim()
        {
            try
            {
                driver.FindElement(By.XPath("/html/body/table/tbody/tr[1]/td/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[1]/td[2]/div/a[20]/img"));
                driver.FindElement(By.XPath("/html/body/table/tbody/tr[1]/td/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[1]/td[2]/div/a[7]/img")).Click();
            }
            catch (Exception)
            {
                driver.FindElement(By.XPath(sistema.XPathBoletim)).Click();
            }


        }

        public void GoDiario()
        {
            try
            {
                driver.FindElement(By.XPath("/html/body/table/tbody/tr[1]/td/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[1]/td[2]/div/a[20]/img"));
                driver.FindElement(By.XPath("/html/body/table/tbody/tr[1]/td/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[1]/td[2]/div/a[6]/img")).Click();
            }
            catch (Exception)
            {
                driver.FindElement(By.XPath(sistema.XPathDiario)).Click();
            }

        }

        private List<Notas> GetNotas()
        {
            string nomeMateria = "";
            decimal valorNotaB1 = 0;
            decimal valorNotaB2 = 0;
            decimal valorNotaB3 = 0;
            decimal valorNotaB4 = 0;
            List<Notas> listaDeNotas = new List<Notas>();
            for (int i = 3; i < 23; i++)
            {
                int qtdNotasLancadas = 0;

                try
                {
                    if (driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]")).Displayed)
                    {
                        nomeMateria = driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[1]")).Text;
                        if (driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[10]")).Text != " ")
                        {
                            valorNotaB1 = Convert.ToDecimal(driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[10]")).Text);
                            qtdNotasLancadas += 1;
                        }
                        else
                        {
                            valorNotaB1 = 0;
                        }
                        if (driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[15]")).Text != " ")
                        {
                            valorNotaB2 = Convert.ToDecimal(driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[15]")).Text);
                            qtdNotasLancadas += 1;
                        }
                        else
                        {
                            valorNotaB2 = 0;
                        }
                        if (driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[20]")).Text != " ")
                        {
                            valorNotaB3 = Convert.ToDecimal(driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[20]")).Text);
                            qtdNotasLancadas += 1;
                        }
                        else
                        {
                            valorNotaB3 = 0;
                        }

                        if (driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[25]")).Text != " ")
                        {
                            valorNotaB4 = Convert.ToDecimal(driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[4]/tbody/tr[" + i + "]/td[25]")).Text);
                            qtdNotasLancadas += 1;
                        }
                        else
                        {
                            valorNotaB4 = 0;
                        }
                    }

                }
                catch (Exception)

                {
                    continue;
                }
                listaDeNotas.AddRange(new[] { new Notas(nomeMateria, valorNotaB1, valorNotaB2, valorNotaB3, valorNotaB4, qtdNotasLancadas) });

            }
            return listaDeNotas;


        }

        private int GetFaltas()
        {
            int totalFaltas = 0;
            for (int i = 0; i <= 20; i++)
            {

                try
                {
                    if (!(driver.FindElement((By.XPath(sistema.XPathBodyTableBoletim + "/tr[" + (i + 3) + "]/td[4]"))).Text == ""))
                    {
                        totalFaltas += Convert.ToInt32(driver.FindElement(By.XPath(sistema.XPathBodyTableBoletim + "/tr[" + (i + 3) + "]/td[4]")).Text);

                    }
                }
                catch (Exception)
                {
                    continue;
                }

            }
            return totalFaltas;
        }

        private int GetTotalAulasPrevistas()
        {
            int aulasPrevistas = 0;
            for (int i = 1; i <= 140; i++)
            {
                try
                {
                    aulasPrevistas += Convert.ToInt32(driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[2]/tbody/tr/td[2]/p/table[2]/tbody/tr[" + i + "]/td[2]/table/tbody/tr[2]/td[2]")).Text);
                }
                catch (Exception)
                {
                    continue;
                }
            }
            return aulasPrevistas;
        }

        private int GetAulasMinistradas()
        {
            int aulasMinistradas = 0;
            for (int i = 1; i <= 200; i++)
            {
                try
                {
                    aulasMinistradas += Convert.ToInt32(driver.FindElement(By.XPath("/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/table[2]/tbody/tr/td[2]/p/table[2]/tbody/tr[" + i + "]/td[2]/table/tbody/tr[3]/td[2]/a[1]")).Text);
                }
                catch (Exception)
                {
                    continue;
                }
            }
            return aulasMinistradas;

        }

        private int CalculaTotalFaltasPermitida()
        {
            int totalPermitido = 0;
            totalPermitido = Convert.ToInt32(usuario.AulasMinistradas * 0.25);
            return totalPermitido;
        }

        private void EncerrarSessaoQacademico()
        {
            driver.FindElement(By.XPath(sistema.XPAthEncerrarSessao)).Click();
        }

        private void ExibirAlerta(string tipo, string mensagem)
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Script", "Alertar('" + tipo + "','Desculpe!','" + mensagem + "');", true);
        }

        private void FecharModal()
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "ScriptFechaModal", "FecharModal();", true);
        }

        private void MatarProcessoChrome()
        {
            var exeChromedriver = Process.GetProcessesByName("chromedriver");
            if (exeChromedriver.Count() > 50)
            {
                foreach (var p in exeChromedriver)
                {
                    p.Kill();
                }

            }

        }

        public void CarregarSessao()
        {
            Sessao ds = new Sessao();
            ds.SetSessao(usuario);
        }












    }
}