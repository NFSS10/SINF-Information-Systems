using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class BestSellers
    {
       
        public List<Model.BestSeller> BestSellersLista
        {
            get;
            set;
        }

        public double TotalVendas
        {
            get;
            set;
        }
    }
}