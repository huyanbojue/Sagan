using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
public class Conexao : IConexao

{
    string IConexao.GetConexao()
    {
        return ConfigurationManager.ConnectionStrings["stringConexao"].ConnectionString;

    }
}