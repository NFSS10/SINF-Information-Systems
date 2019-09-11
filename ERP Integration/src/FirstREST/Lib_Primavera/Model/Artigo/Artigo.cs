using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class Artigo
    {
       
        public string CodArtigo
        {
            get;
            set;
        }

        public string NomeArtigo
        {
            get;
            set;
        }


        public float Desconto
        {
            get;
            set;
        }

        public double Preco
        {
            get;
            set;
        }

        public string Familia
        {
            get;
            set;
        }

        public List<Model.Stock> StockExistente
        {
            get;
            set;
        }

    }
}