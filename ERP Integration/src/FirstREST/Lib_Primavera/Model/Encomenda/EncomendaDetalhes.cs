using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FirstREST.Lib_Primavera.Model
{
    public class EncomendaDetalhes
    {

        public List<Model.DetalhesCompraArtigo> artigos
        {
            get;
            set;
        }

        public List<Model.EstadoEncomenda> estados
        {
            get;
            set;
        }

        public DateTime dataCriacao
        {
            get;
            set;
        }

        public string Horas
        {
            get;
            set;
        }

    }
}