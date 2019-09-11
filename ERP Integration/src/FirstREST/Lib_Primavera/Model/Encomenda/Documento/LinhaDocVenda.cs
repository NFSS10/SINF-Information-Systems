using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class LinhaDocVenda
    {


        public string CodArtigo
        {
            get;
            set;
        }

         public double Quantidade
        {
            get;
            set;
        }

         public double Desconto
        {
            get;
            set;
        }

       
         public double PrecoUnitario
        {
            get;
            set;
        }
    }
}