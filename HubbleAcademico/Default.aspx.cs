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

namespace HubbleAcademico
{
    public partial class Graficos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (new Sessao().Existe())
                {
                    Session.Abandon();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    WUC_LOGIN.Inicial();
                }
            }
        }
    }
}






