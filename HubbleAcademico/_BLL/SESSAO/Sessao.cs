using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;

public class Sessao  
{
   

    public void SetSessao(Usuario _tdDadosSessao)
    {
        HttpContext.Current.Session["usuarioAtivo"] = _tdDadosSessao;
    }
    public Usuario Dados()
    {
        return  (Usuario)HttpContext.Current.Session["usuarioAtivo"];
    } 
    
    public bool Existe()
    {
        return HttpContext.Current.Session["usuarioAtivo"] != null;
    }

}