using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using FirstREST.Lib_Primavera.Model;


namespace FirstREST.Controllers
{
    public class ArtigosController : ApiController
    {
        //
        // GET: /Artigos/
        
        public IEnumerable<Lib_Primavera.Model.Artigo> GetArtigos()
        {
            return Lib_Primavera.PriIntegration.ListaArtigos();
        }


        // GET api/artigos/{id_artigo}    
        public Artigo GetById(string id)
        {
            Lib_Primavera.Model.Artigo artigo = Lib_Primavera.PriIntegration.GetArtigo(id);
            if (artigo == null)
            {
                throw new HttpResponseException(
                  Request.CreateResponse(HttpStatusCode.NotFound));
            }
            else
           {
                return artigo;
            }
        }


        public BestSellers GetBestSellers()
        {
               return Lib_Primavera.PriIntegration.ListaBestSellers();
        }

        public IEnumerable<Lib_Primavera.Model.Artigo> GetMelhoresDescontos()
        {
            return Lib_Primavera.PriIntegration.ListaMelhoresDescontos();
        }

    }
}

