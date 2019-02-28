using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


    public abstract class Crud
    {
        #region Atributos
        protected string _strCon;
        protected bool _found;
        protected int _idUser;
        #endregion

        #region Propriedades
        public bool Found { get; set; }
        #endregion

        #region Construtor

        public Crud() { }
        public Crud(IConexao p_conexao)
        {
            this._strCon = p_conexao.GetConexao();
        }
        public Crud(IConexao p_conexao, IUsuarioSESSION p_usuarioSESSION)
        {
            this._strCon = p_conexao.GetConexao();
            this._idUser = p_usuarioSESSION.GetIdUsuarioSESSION();
        }


        #endregion

        #region METODOS HERDADOS        
         public DataTable List()
        {
            SqlConnection cnx = new SqlConnection(_strCon);
            SqlDataAdapter adp = new SqlDataAdapter(@"",cnx);

            try
            {
                DataTable dt = new DataTable();
                cnx.Open();
                adp = Listar(adp);
                adp.Fill(dt);
                return dt;
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

        }
        public void Retrieve()
        {
            SqlConnection cnx= new SqlConnection(_strCon);
        SqlCommand cmd = new SqlCommand();
            try
            {
                cmd.Connection = cnx;
                cnx.Open();
                this.Reter(cmd);

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
        public bool Escolha(byte opcao) {
            SqlConnection cnx = new SqlConnection(_strCon);
            SqlCommand cmd = new SqlCommand();
            try
            {
                cnx.Open();
                cmd.Connection = cnx;

                switch (opcao)
                {
                    case 1:
                        return Salvar(cmd);
                    case 2:
                        return Atualizar(cmd);
                    case 3:
                        return Deletar(cmd);
                    default:
                        return true;
                }
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
        public bool Save()
        {
            return Escolha(1);
        }


        public bool Update() {

            return Escolha(2);
        }

        public bool Delete() {
            return Escolha(3);

        }
        #endregion

        #region METODOS IMPLEMENTADOS
        protected abstract SqlDataAdapter Listar(SqlDataAdapter adp);
        protected abstract void Reter(SqlCommand cmd);
        protected abstract bool Salvar(SqlCommand cmd);
        protected abstract bool Atualizar(SqlCommand cmd);
        protected abstract bool Deletar(SqlCommand cmd);
        #endregion
    }
