﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class DocVenda
    {
        public string Id
        {
            get;
            set;
        }

        public string Serie
        {
            get;
            set;
        }


        public Model.Cliente Cliente
        {
            get;
            set;
        }

        public List<Model.LinhaDocVenda> LinhasDoc
        {
            get;
            set;
        }
 

    }
}
