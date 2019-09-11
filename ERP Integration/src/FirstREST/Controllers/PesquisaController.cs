using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FirstREST.Controllers
{
    public class PesquisaController : ApiController
    {

        public IEnumerable<Lib_Primavera.Model.Artigo> GetArtigos(string algo)
        {
            return Lib_Primavera.PriIntegration.ListaResultadosPesquisa(algo);
        }

    }
}
