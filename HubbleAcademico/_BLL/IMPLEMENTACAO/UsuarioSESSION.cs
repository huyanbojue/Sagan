using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class UsuarioSESSION : IUsuarioSESSION
{
    private int idUsuarioLogado;

    public int GetIdUsuarioSESSION()
    {
        return idUsuarioLogado;
    }

    public UsuarioSESSION()
    {
        try
        {
            idUsuarioLogado = Convert.ToInt16(new Sessao().Dados().IdUsuario) ;
        }
        catch (Exception)
        {
            idUsuarioLogado = 0;
        }
    }
}
