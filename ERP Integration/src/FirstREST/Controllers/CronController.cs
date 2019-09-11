using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FirstREST.Controllers
{
    public class CronController : ApiController
    {
        public Lib_Primavera.Model.UpdateDatabase GetSynchronize()
        {
            return Lib_Primavera.PriIntegration.syncronize();
        }

    }
}
