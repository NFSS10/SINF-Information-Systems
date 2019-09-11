using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class DetalhesCompraArtigo
    {
        public string codArtigo
        {
            get;
            set;
        }

        public string nomeArtigo
        {
            get;
            set;
        }

        public string categoria
        {
            get;
            set;
        }

        public double quantidade
        {
            get;
            set;
        }

        public float desconto
        {
            get;
            set;
        }

        public double precoLiquido
        {
            get;
            set;
        }

        public float iva
        {
            get;
            set;
        }
    }
}