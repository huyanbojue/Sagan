using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Notas
{
    #region CONSTRUTOR
  

    public Notas(string nomeMateria, decimal valorBimestre1, decimal valorBimestre2, decimal valorBimestre3, decimal valorBimestre4, int qtdNotasLancadas)
    {
        this.NomeMateria = nomeMateria;
        this.valorBimestre1 = valorBimestre1;
        this.valorBimestre2 = valorBimestre2;
        this.valorBimestre3 = valorBimestre3;
        this.valorBimestre4 = valorBimestre4;
        this.qtdNotasLancadas = qtdNotasLancadas;
    }
    #endregion

    #region ATRIBUTOS
    private string nomeMateria;
    private decimal valorBimestre1;
    private decimal valorBimestre2;
    private decimal valorBimestre3;
    private decimal valorBimestre4;
    private int qtdNotasLancadas;

    #endregion

    #region GET/SET
    public decimal ValorBimestre1 { get => valorBimestre1; set => valorBimestre1 = value; }
    public decimal ValorBimestre2 { get => valorBimestre2; set => valorBimestre2 = value; }
    public decimal ValorBimestre3 { get => valorBimestre3; set => valorBimestre3 = value; }
    public decimal ValorBimestre4 { get => valorBimestre4; set => valorBimestre4 = value; }
    public string NomeMateria { get => nomeMateria; set => nomeMateria = value; }
    public int QtdNotasLancadas { get => qtdNotasLancadas; set => qtdNotasLancadas = value; }
    #endregion

  

}
