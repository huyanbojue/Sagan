using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

public class Usuario : Crud
{
    #region ATRIBUTOS
    private int idUsuario;
    private string nomeUsuario;
    private string loginAcademico;
    private string senhaAcademico;
    private string loginSistema;
    private string senhaSistema;
    private bool isAceitouTermos;
    private int totalFatas;
    private int totalFaltasPErmitidas;
    private int aulasPrevistas;
    private int aulasMinistradas;
    private string respostaSecreta;
    private List<Notas> notasList = new List<Notas>();
    #endregion

    #region GET/SET
    public int IdUsuario { get => idUsuario; set => idUsuario = value; }
    public string NomeUsuario { get => nomeUsuario; set => nomeUsuario = value; }
    public string LoginAcademico { get => loginAcademico; set => loginAcademico = value; }
    public string SenhaAcademico { get => senhaAcademico; set => senhaAcademico = value; }
    public string LoginSistema { get => loginSistema; set => loginSistema = value; }
    public string SenhaSistema { get => senhaSistema; set => senhaSistema = value; }
    public bool IsAceitouTemos { get => isAceitouTermos; set => isAceitouTermos = value; }
    public int TotalFatas { get => totalFatas; set => totalFatas = value; }
    public int AulasPrevistas { get => aulasPrevistas; set => aulasPrevistas = value; }
    public int AulasMinistradas { get => aulasMinistradas; set => aulasMinistradas = value; }
    public string RespostaSecreta { get => respostaSecreta; set => respostaSecreta = value; }
    public List<Notas> NotasList { get => notasList; set => notasList = value; }
    public int TotalFaltasPErmitidas { get => totalFaltasPErmitidas; set => totalFaltasPErmitidas = value; }
    #endregion

    #region COSNTRUTOR
    public Usuario(IConexao p_conexao) : base(p_conexao)
    {
        base._strCon = p_conexao.GetConexao();
    }

    public Usuario(IConexao p_conexao, IUsuarioSESSION p_usuarioSESSION) : base(p_conexao, p_usuarioSESSION)
    {
        base._strCon = p_conexao.GetConexao();
        base._idUser = p_usuarioSESSION.GetIdUsuarioSESSION();
    }
    #endregion

    #region CRUD

    #region LIST

    protected override SqlDataAdapter Listar(SqlDataAdapter adp)
    {
        adp.SelectCommand.CommandText = "usp_usuario_list";
        adp.SelectCommand.CommandType = CommandType.StoredProcedure;
        return adp;
    }

    public DataTable List_email(string email)
    {
        SqlConnection cnx = new SqlConnection(base._strCon);
        SqlDataAdapter adp = new SqlDataAdapter("usp_checar_email", cnx);
        adp.SelectCommand.CommandType = CommandType.StoredProcedure;
        adp.SelectCommand.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = email;
        DataTable dt = new DataTable();
        try
        {
            cnx.Open();
            adp.Fill(dt);
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            cnx.Close();
            cnx.Dispose();
            adp.Dispose();

        }

        return dt;

    }





    public DataTable List_matricula(string matricula)
    {
        SqlConnection cnx = new SqlConnection(base._strCon);
        SqlDataAdapter adp = new SqlDataAdapter("usp_checar_matricula", cnx);
        adp.SelectCommand.CommandType = CommandType.StoredProcedure;
        adp.SelectCommand.Parameters.Add("@matricula", SqlDbType.VarChar, 30).Value = matricula;
        DataTable dt = new DataTable();
        try
        {
            cnx.Open();
            adp.Fill(dt);
        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            cnx.Close();
            cnx.Dispose();
            adp.Dispose();
        }
        return dt;
    }


    #endregion

    #region UPDATE
    protected override bool Atualizar(SqlCommand cmd)
    {
        throw new NotImplementedException();
    }

    #endregion

    #region RETRIVE

    protected override void Reter(SqlCommand cmd)
    {
        cmd.CommandText = "usp_usuario_Retrive";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@idUsuario", SqlDbType.Int).Value = idUsuario;
        PreencherAtributos(cmd.ExecuteReader());
    }
    public void RetriveAutenticacao()
    {
        SqlConnection cnx = new SqlConnection(base._strCon);
        SqlCommand cmd = new SqlCommand("usp_Usuario_Autenticacao", cnx);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@usuarioSistema", SqlDbType.VarChar, 50).Value = this.LoginSistema;
        cmd.Parameters.Add("@senhaSistema", SqlDbType.VarChar, 30).Value = this.SenhaSistema;
        try
        {
            cnx.Open();
            PreencherAtributos(cmd.ExecuteReader());
        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            cnx.Close();
            cnx.Dispose();
            cmd.Dispose();
        }

    }
    public void RetriveRecuperarSenha(string respostaSecreta)
    {
        SqlConnection cnx = new SqlConnection(base._strCon);
        SqlCommand cmd = new SqlCommand("usp_usuario_retrive_respostaSeguranca", cnx);
        cmd.Parameters.Add("@respostaSeguranca", SqlDbType.VarChar, 50).Value = respostaSecreta;
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            cnx.Open();
            PreencherRecuperarSenha(cmd.ExecuteReader());
        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            cnx.Close();
            cnx.Dispose();
            cmd.Dispose();
        }

    }
    #endregion

    #region DELETE

    protected override bool Deletar(SqlCommand cmd)
    {
        throw new NotImplementedException();
    }
    #endregion

    #region SAVE

    protected override bool Salvar(SqlCommand cmd)
    {
        cmd.CommandText = "usp_usuario_salvar";
        cmd.CommandType = CommandType.StoredProcedure;
        PreencherParametros(cmd);
        return cmd.ExecuteNonQuery() > 0;

    }
    #endregion

    #endregion

    #region AUXILIARES
    private void PreencherRecuperarSenha(SqlDataReader dr)
    {
        if (dr.Read())
        {
            base.Found = true;
            if (!(dr["nomeUsuario"] is DBNull)) { this.nomeUsuario = Convert.ToString(dr["nomeUsuario"]); }
            if (!(dr["emailAcessoSistema"] is DBNull)) { this.loginSistema = Convert.ToString(dr["emailAcessoSistema"]); }
        }
    }

    public void PreencherAtributos(SqlDataReader dr)
    {
        if (dr.Read())
        {
            base.Found = true;
            if (!(dr["idUsuario"] is DBNull)) { this.idUsuario = Convert.ToInt32(dr["idUsuario"]); }
            if (!(dr["nomeUsuario"] is DBNull)) { this.nomeUsuario = Convert.ToString(dr["nomeUsuario"]); }
            if (!(dr["loginAcademico"] is DBNull)) { this.loginAcademico = Convert.ToString(dr["loginAcademico"]); }
            if (!(dr["senhaAcademico"] is DBNull)) { this.senhaAcademico = Convert.ToString(dr["senhaAcademico"]); }
            if (!(dr["emailAcessoSistema"] is DBNull)) { this.loginSistema = Convert.ToString(dr["emailAcessoSistema"]); }
            if (!(dr["senhaSistema"] is DBNull)) { this.senhaSistema = Convert.ToString(dr["senhaSistema"]); }
            if (!(dr["isAceitouTermos"] is DBNull)) { this.isAceitouTermos = Convert.ToBoolean(dr["isAceitouTermos"]); }
            if (!(dr["respostaSecreta"] is DBNull)) { this.RespostaSecreta = Convert.ToString(dr["respostaSecreta"]); }
        }
    }

    public void PreencherParametros(SqlCommand cmd)
    {
        cmd.Parameters.Add("@nomeUsuario", SqlDbType.VarChar, 30).Value = this.NomeUsuario;
        cmd.Parameters.Add("@loginAcademico", SqlDbType.VarChar, 50).Value = this.LoginAcademico;
        cmd.Parameters.Add("@senhaAcademico", SqlDbType.VarChar, 30).Value = this.SenhaAcademico;
        cmd.Parameters.Add("@emailAcessoSistema", SqlDbType.VarChar, 50).Value = this.LoginSistema;
        cmd.Parameters.Add("@senhaSistema", SqlDbType.VarChar, 30).Value = this.SenhaSistema;
        cmd.Parameters.Add("@isAceitoTermos", SqlDbType.Bit).Value = this.IsAceitouTemos;
        cmd.Parameters.Add("@respostaSecreta", SqlDbType.VarChar, 20).Value = this.RespostaSecreta;

    }

    #endregion
}