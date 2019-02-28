using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Threading;
namespace HubbleAcademico.UI.WUC
{
    public partial class wuc_recuSenha : System.Web.UI.UserControl
    {
        private Random codigoAcesso = new Random();

        public void Inicial()
        {

            pnl_codigo.Visible = false;
            btn_codigo.Visible = false;
            btn_respostaSecreta.Visible = true;
            pnl_respostaSecreta.Visible = true;
            pnl_novaSenha.Visible = false;
            btn_novaSenha.Visible = false;

        }

        protected void Btn_respostaSecreta_click(object sender, EventArgs e)
        {
            
          
            if (new Usuario(new Conexao()).List_email(txt_email.Text).Rows.Count > 0)
            {
                Thread.Sleep(1 * 8000);
                Usuario usuario = new Usuario(new Conexao());
                usuario.RetriveRecuperarSenha(txt_respostaChave.Text);
                if (usuario.Found)
                {
                    //Email _email = new Email
                    //{
                    //    Para1 = usuario.LoginSistema,
                    //    De1 = ConfigurationManager.AppSettings["EmailRecuperaSenha"],
                    //    Senha1 = ConfigurationManager.AppSettings["SenhaEmail"],
                    //    Login1 = ConfigurationManager.AppSettings["LoginEmail"],
                    //    Host1 = ConfigurationManager.AppSettings["Host"],
                    //    Porta1 = Convert.ToInt32(ConfigurationManager.AppSettings["Porta"]),
                    //    PossuiSSL1 = Convert.ToBoolean(ConfigurationManager.AppSettings["SSL"]),
                    //    Assunto1 = "No-Reply",
                    //    Corpo1 = MontarCorpoEmail(usuario)
                    //};
                    //if (_email.Enviar())
                    //{
                        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Script", "Alertar('success','Sucesso!','Enviamos o código de recuperação para o seu email.');FecharFundoPreto();AbrirModalRecSenha();", true);
                    //}
                    
                    pnl_codigo.Visible = true;
                    btn_codigo.Visible = true;
                    btn_respostaSecreta.Visible = false;
                    pnl_respostaSecreta.Visible = false;
                    pnl_novaSenha.Visible = false;
                    btn_novaSenha.Visible = false;
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Script", "Alertar('error','Desculpe!','Resposta secreta inválida!');", true);

                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "Script", "Alertar('error','Desculpe!','Desculpe, endereço de Email não cadastrado!');", true);

            }
        }
        protected void Btn_codigo_click(object sender,EventArgs e)
        {
            if (txt_codigo.Text == Convert.ToString(this.codigoAcesso)) {

            }

        }
        protected void Btn_novaSenha_click(object sender, EventArgs e)
        {

        }

        public string MontarCorpoEmail(Usuario user)
        {
            StringBuilder str = new StringBuilder();
            codigoAcesso.Next(100000, 900000000);
            str.Append("Olá "+user.NomeUsuario+", o código para alteração de senha de sua conta InfoHelix é: "+ codigoAcesso);
            return str.ToString();

        }
    }
}