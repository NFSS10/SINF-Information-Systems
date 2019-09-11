using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class Encomenda
    {

        public int NumDoc
        {
            get;
            set;
        }

        public string Serie
        {
            get;
            set;
        }

        public DateTime Data
        {
            get;
            set;
        }

        public string Horas
        {
            get;
            set;
        }

        public Model.EstadoEncomenda Estado
        {
            get;
            set;
        }
    }
}