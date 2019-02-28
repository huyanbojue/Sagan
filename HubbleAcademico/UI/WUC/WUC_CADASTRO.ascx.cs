using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HubbleAcademico;
using System.Data;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support;
using System.Threading;
namespace HubbleAcademico.UI.WUC
{
    public partial class wuc_cadastro : System.Web.UI.UserControl
    {
        private IWebDriver driver;
        private QAcademico sistema;
        private Usuario user;

  

        protected void linkBtn_Click(object sender, EventArgs e)
        {
            if (!(EmailJaCadastrado()))
            {
                if (!(MatriculaJaCadastrada()))
                {
                    if (cb_isAceitoTermos.Checked)
                    {

                        this.sistema = new QAcademico(new Conexao())
                        {
                            IdSistema = 1
                        };
                        this.sistema.Retrieve();
                        PreencherAtributos();
                        AbrirChrome();
                        LogarQAcademico();
                        EncerrarSessaoAcademico();
                        driver.Close();
                        if (user.Save())
                        {
                            ExibirAlerta("success", "Cadastro realizado com sucesso", "Obrigado!");
                            LimparCampos();
                            FecharModal();
                        }
                        else
                        {
                            ExibirAlerta("error", "Erro desconhecido ao salvar usuário. Por favor, contate o desenvolvedor", "Desculpe!");
                        }

                    }
                    else
                    {
                        ExibirAlerta("error", "É necessário aceitar os termos de uso", "Desculpe!");
                        FecharModal();
                    }
                }
                else
                {
                    ExibirAlerta("error", "Nº de Matrícula já Cadastrado", "Desculpe!");
                    FecharModal();
                }
            }
            else
            {
                ExibirAlerta("error", "Email já cadastrado", "Desculpe!");
                FecharModal();
            }


        }


        private void AbrirChrome()
        {
            this.driver = new ChromeDriver("C:/WWW/Hubble/bin");

        }
        private void LogarQAcademico()
        {
            driver.Navigate().GoToUrl(sistema.UrlSistema);
            driver.FindElement(By.XPath(sistema.XPathLinkAlunos)).Click();
            driver.FindElement(By.XPath(sistema.XPathLogin)).SendKeys(txt_loginAcademico.Text);
            driver.FindElement(By.XPath(sistema.XPathSenha)).SendKeys(txt_senhaAcademico.Text);
            driver.FindElement(By.XPath(sistema.XPathBtnLogar)).Click();
            try
            {
                user.NomeUsuario = getNomeUsuario();
            }
            catch (Exception)
            {
                ExibirAlerta("error", "Nº de matrícula ou senha do Q-Acadêmico são inválidos!", "Desculpe!");
                FecharModal();
                return;
            }
        }

        private void PreencherAtributos()
        {
            this.user = new Usuario(new Conexao());
            user.LoginAcademico = txt_loginAcademico.Text;
            user.SenhaAcademico = txt_senhaAcademico.Text;
            user.LoginSistema = txt_email.Text;
            user.SenhaSistema = txt_senhaSistema.Text;
            user.IsAceitouTemos = cb_isAceitoTermos.Checked;
            user.RespostaSecreta = txt_respostaSecreta.Text;


        }
        public void FecharModal()
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "ScriptFechaModal", "FecharModal();", true);
        }

        public bool EmailJaCadastrado()
        {
            if (new Usuario(new Conexao()).List_email(txt_email.Text).Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool MatriculaJaCadastrada()
        {
            if (new Usuario(new Conexao()).List_matricula(txt_loginAcademico.Text).Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public string getNomeUsuario()
        {


            if (driver.FindElement(By.XPath(sistema.XPAthNomeAluno)).Text.Substring(0, 2) == "Bom")
            {
                int qtdCaracteresNome = (driver.FindElement(By.XPath(sistema.XPAthNomeAluno)).Text.Substring(9)).Trim().Length;
                return ((driver.FindElement(By.XPath(sistema.XPAthNomeAluno)).Text.Substring(9, qtdCaracteresNome - 1)).Trim()).Trim();
            }
            else
            {
                int qtdCaracteresNome = (driver.FindElement(By.XPath(sistema.XPAthNomeAluno)).Text.Substring(11)).Trim().Length;
                return ((driver.FindElement(By.XPath(sistema.XPAthNomeAluno)).Text.Substring(11, qtdCaracteresNome - 1)).Trim()).Trim();
            }
        }

        public void EncerrarSessaoAcademico()
        {
            driver.FindElement(By.XPath(sistema.XPAthEncerrarSessao)).Click();
        }


        public void ExibirAlerta(string tipo, string mensagem, string titulo)
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Script", "Alertar('" + tipo + "','" + titulo + "','" + mensagem + "');", true);
        }
        public void LimparCampos()
        {
            txt_email.Text = "";
            txt_loginAcademico.Text = "";
            txt_respostaSecreta.Text = "";
            txt_senhaAcademico.Text = "";
            txt_senhaSistema.Text = "";
            cb_isAceitoTermos.Checked = false;
            ddl_perguntaRec.SelectedIndex = 0;
        }

    }
}