using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class UpdateDatabase
    {
        public List<Model.Familia> Familias
        {
            get;
            set;
        }


        public List<Model.Armazem> Armazens
        {
            get;
            set;
        }

        public List<Model.Cliente> Clientes
        {
            get;
            set;
        }

        public List<Model.Artigo> Artigos
        {
            get;
            set;
        }
       
    }
}