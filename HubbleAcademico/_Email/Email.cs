using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

    public class Email
    {
        #region ATRIBUTOS
        string Para;
        string De;
        string Login;
        string Senha;
        string Assunto;
        string Corpo;
        string Host;
        int Porta;
        bool PossuiSSL;


        #endregion

        #region GET/SET
        public string Para1 { get => Para; set => Para = value; }
        public string De1 { get => De; set => De = value; }
        public string Login1 { get => Login; set => Login = value; }
        public string Senha1 { get => Senha; set => Senha = value; }
        public string Assunto1 { get => Assunto; set => Assunto = value; }
        public string Corpo1 { get => Corpo; set => Corpo = value; }
        public string Host1 { get => Host; set => Host = value; }
        public int Porta1 { get => Porta; set => Porta = value; }
        public bool PossuiSSL1 { get => PossuiSSL; set => PossuiSSL = value; }
        #endregion

        #region METODOS
        public bool Enviar()
        {
            try
            {
                SmtpClient smtp = new SmtpClient();
                MailMessage email = new MailMessage();
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(Login1, Senha1);
                smtp.Port = Porta;
                smtp.EnableSsl = true;
                smtp.Host = Host1;
                email = new MailMessage();
                email.From = new MailAddress(De1);
                email.To.Add(Para1);
                email.Subject = Assunto1;
                email.IsBodyHtml = true;
                email.Body = Corpo;
                smtp.Send(email);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion
    }
