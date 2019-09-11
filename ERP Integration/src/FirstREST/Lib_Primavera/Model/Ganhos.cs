using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class Ganhos
    {

        //Numero Vendas deste mes
        public double GanhoVendasAtual
        {
            get;
            set;
        }

        //ganhos nos 3 meses anteriores
        public List<Model.GanhosMes> GanhosMesesAnt
        {
            get;
            set;
        }

    }
}