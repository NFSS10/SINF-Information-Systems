using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace FirstREST
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            //CronController
            config.Routes.MapHttpRoute(
               name: "syncronizeDB",
               routeTemplate: "api/synchronize",
               defaults: new { controller = "Cron", action = "GetSynchronize" }
           );

            //ArtigosController

            config.Routes.MapHttpRoute(
                name: "getArtigos",
                routeTemplate: "api/artigos",
                defaults: new {controller="Artigos", action = "GetArtigos"}
            );

            config.Routes.MapHttpRoute(
               name: "getBestsellers",
               routeTemplate: "api/artigos/bestsellers",
               defaults: new { controller = "Artigos", action = "GetBestSellers"}
           );

            config.Routes.MapHttpRoute(
               name: "getDescontos",
               routeTemplate: "api/artigos/topdescontos",
               defaults: new { controller = "Artigos", action= "GetMelhoresDescontos" }
           );

            config.Routes.MapHttpRoute(
               name: "getArtigo",
               routeTemplate: "api/artigos/{id}",
               defaults: new { controller = "Artigos"}
           );


            //EncomendasController

            config.Routes.MapHttpRoute(
               name: "getEncomendas",
               routeTemplate: "api/encomendas/{id}/{id2}/{id3}",
               defaults: new { controller = "Encomendas", id2= RouteParameter.Optional, id3= RouteParameter.Optional}
           );

            config.Routes.MapHttpRoute(
               name: "postEncomenda",
               routeTemplate: "api/checkout",
               defaults: new { controller = "Encomendas"}
           );

            //ClientesController
            config.Routes.MapHttpRoute(
               name: "UpdateClientes",
               routeTemplate: "api/clientes/{id}",
               defaults: new { controller = "Clientes", id = RouteParameter.Optional }
           );


            //PlataformasController
            config.Routes.MapHttpRoute(
               name: "getVendasDasPlataformas",
               routeTemplate: "api/plataformas",
               defaults: new { controller = "Plataformas"}
           );

            //GanhosController

            config.Routes.MapHttpRoute(
               name: "getGanhos",
               routeTemplate: "api/ganhos/{year}/{month}",
               defaults: new { controller = "Ganhos" }
           );

            //procuraController

            config.Routes.MapHttpRoute(
              name: "getResultadosPesquisa",
              routeTemplate: "api/pesquisa/{algo}",
              defaults: new { controller = "Pesquisa" }
          );


            // Uncomment the following line of code to enable query support for actions with an IQueryable or IQueryable<T> return type.
            // To avoid processing unexpected or malicious queries, use the validation settings on QueryableAttribute to validate incoming queries.
            // For more information, visit http://go.microsoft.com/fwlink/?LinkId=279712.
            //config.EnableQuerySupport();

            // To disable tracing in your application, please comment out or remove the following line of code
            // For more information, refer to: http://www.asp.net/web-api
           // config.EnableSystemDiagnosticsTracing();
        }
    }
}
