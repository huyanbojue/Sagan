using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

public class QAcademico : Crud

{

    #region CONSTRUTOR
    public QAcademico(IConexao p_conexao) : base(p_conexao)
    {
        base._strCon = p_conexao.GetConexao();
    }


    public QAcademico(IConexao p_conexao, IUsuarioSESSION p_usuarioSESSION) : base(p_conexao, p_usuarioSESSION)
    {
        base._strCon = p_conexao.GetConexao();
        base._idUser = p_usuarioSESSION.GetIdUsuarioSESSION();
    }
    #endregion

    #region Atributos
    private int idSistema;
    private string nomeSistema;
    private string urlSistema;
    private string xPathLinkAlunos;
    private string xPathLogin;
    private string xPathSenha;
    private string xPathBtnLogar;
    private string xPathTableBoletim;
    private string xPathNomeAluno;
    private string xPathEncerrarSessao;
    private string xPathDiario;
    private string xPathBoletim;
    #endregion

    #region GET/SET
    public int IdSistema { get => idSistema; set => idSistema = value; }
    public string NomeSistema { get => nomeSistema; set => nomeSistema = value; }
    public string UrlSistema { get => urlSistema; set => urlSistema = value; }
    public string XPathLinkAlunos { get => xPathLinkAlunos; set => xPathLinkAlunos = value; }
    public string XPathLogin { get => xPathLogin; set => xPathLogin = value; }
    public string XPathSenha { get => xPathSenha; set => xPathSenha = value; }
    public string XPathBtnLogar { get => xPathBtnLogar; set => xPathBtnLogar = value; }
    public string XPathBodyTableBoletim { get => xPathTableBoletim; set => xPathTableBoletim = value; }
    public string XPAthNomeAluno { get => xPathNomeAluno; set => xPathNomeAluno = value; }
    public string XPAthEncerrarSessao { get => xPathEncerrarSessao; set => xPathEncerrarSessao = value; }
    public string XPathDiario { get => xPathDiario; set => xPathDiario = value; }
    public string XPathBoletim { get => xPathBoletim; set => xPathBoletim = value; }
    #endregion

    #region CRUD
    protected override bool Atualizar(SqlCommand cmd)
    {
        throw new NotImplementedException();
    }

    protected override bool Deletar(SqlCommand cmd)
    {
        throw new NotImplementedException();
    }

    protected override SqlDataAdapter Listar(SqlDataAdapter adp)
    {
        throw new NotImplementedException();
    }

    protected override void Reter(SqlCommand cmd)
    {
        cmd.CommandText = "usp_Sistema_Retrive";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@idSistema", SqlDbType.Int).Value = IdSistema;
        PreencherAtributos(cmd.ExecuteReader());
    }

    protected override bool Salvar(SqlCommand cmd)
    {
        throw new NotImplementedException();
    }
    #endregion

    #region AUX
    public void PreencherAtributos(SqlDataReader dr)
    {
        if (dr.Read())
        {
            base.Found = true;

            if (!(dr["idSistema"] is DBNull)) { this.idSistema = Convert.ToInt32(dr["idSistema"]); }
            if (!(dr["nomeSistema"] is DBNull)) { this.nomeSistema = Convert.ToString(dr["nomeSistema"]); }
            if (!(dr["urlSistema"] is DBNull)) { this.urlSistema = Convert.ToString(dr["urlSistema"]); }
            if (!(dr["xPathLinkAlunos"] is DBNull)) { this.xPathLinkAlunos = Convert.ToString(dr["xPathLinkAlunos"]); }
            if (!(dr["xPathLogin"] is DBNull)) { this.xPathLogin = Convert.ToString(dr["xPathLogin"]); }
            if (!(dr["xPathSenha"] is DBNull)) { this.xPathSenha = Convert.ToString(dr["xPathSenha"]); }
            if (!(dr["xPathBtnLogar"] is DBNull)) { this.xPathBtnLogar = Convert.ToString(dr["xPathBtnLogar"]); }
            if (!(dr["xPathBodyTableBoletim"] is DBNull)) { this.xPathTableBoletim = Convert.ToString(dr["xPathBodyTableBoletim"]); }
            if (!(dr["xPathNomeAluno"] is DBNull)) { this.XPAthNomeAluno = Convert.ToString(dr["xPathNomeAluno"]); }
            if (!(dr["xPathEncerrarSessao"] is DBNull)) { this.XPAthEncerrarSessao = Convert.ToString(dr["xPathEncerrarSessao"]); }
            if (!(dr["xPathBoletim"] is DBNull)) { this.XPathBoletim = Convert.ToString(dr["xPathBoletim"]); }
            if (!(dr["xPathDiario"] is DBNull)) { this.XPathDiario = Convert.ToString(dr["xPathDiario"]); }
        }
    }

   
    #endregion

}
