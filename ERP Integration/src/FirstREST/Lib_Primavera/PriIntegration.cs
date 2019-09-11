using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Interop.ErpBS900;
using Interop.StdPlatBS900;
using Interop.StdBE900;
using Interop.GcpBE900;
using ADODB;

namespace FirstREST.Lib_Primavera
{
    public class PriIntegration
    {
        

        # region Cliente

        public static List<Model.Cliente> ListaClientes()
        {
            
            
            StdBELista objList;

            List<Model.Cliente> listClientes = new List<Model.Cliente>();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                objList = PriEngine.Engine.Consulta("SELECT Cliente, Nome, NumContrib as NumContribuinte, Fac_Mor AS Morada FROM CLIENTES");

                
                while (!objList.NoFim())
                {
                    listClientes.Add(new Model.Cliente
                    {
                        CodCliente = objList.Valor("Cliente"),
                        NomeCliente = objList.Valor("Nome"),
                        NumContribuinte = objList.Valor("NumContribuinte"),
                    });
                    objList.Seguinte();

                }

                return listClientes;
            }
            else
                return null;
        }

        public static Lib_Primavera.Model.Cliente GetCliente(string codCliente)
        {
            

            GcpBECliente objCli = new GcpBECliente();


            Model.Cliente myCli = new Model.Cliente();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                if (PriEngine.Engine.Comercial.Clientes.Existe(codCliente) == true)
                {
                    
                    objCli = PriEngine.Engine.Comercial.Clientes.Edita(codCliente);
                    myCli.CodCliente = objCli.get_Cliente();
                    myCli.NomeCliente = objCli.get_Nome();
                    myCli.NumContribuinte = objCli.get_NumContribuinte();
                    myCli.Morada = objCli.get_Morada();
                  
                    
                    return myCli;
                }
                else
                {
                    return null;
                }
            }
            else
                return null;
        }

        public static Lib_Primavera.Model.RespostaErro UpdCliente(Lib_Primavera.Model.Cliente cliente)
        {
            Lib_Primavera.Model.RespostaErro erro = new Model.RespostaErro();
           

            GcpBECliente objCli = new GcpBECliente();

            try
            {

                if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
                {

                    if (PriEngine.Engine.Comercial.Clientes.Existe(cliente.CodCliente) == false)
                    {
                        erro.Erro = 1;
                        erro.Descricao = "O cliente não existe";
                        return erro;
                    }
                    else
                    {

                        objCli = PriEngine.Engine.Comercial.Clientes.Edita(cliente.CodCliente);
                        objCli.set_EmModoEdicao(true);

                        objCli.set_Nome(cliente.NomeCliente);
                        
                        objCli.set_Morada(cliente.Morada);
                        objCli.set_Localidade(cliente.Localidade);
                        objCli.set_CodigoPostal(cliente.Cpostal);

                        
                        PriEngine.Engine.Comercial.Clientes.Actualiza(objCli);

                        erro.Erro = 0;
                        erro.Descricao = "Sucesso";
                        return erro;
                    }
                }
                else
                {
                    erro.Erro = 1;
                    erro.Descricao = "Erro ao abrir a empresa";
                    return erro;

                }

            }

            catch (Exception ex)
            {
                erro.Erro = 1;
                erro.Descricao = ex.Message;
                return erro;
            }

        }


        public static Lib_Primavera.Model.RespostaErro DelCliente(string codCliente)
        {

            Lib_Primavera.Model.RespostaErro erro = new Model.RespostaErro();
            GcpBECliente objCli = new GcpBECliente();


            try
            {

                if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
                {
                    if (PriEngine.Engine.Comercial.Clientes.Existe(codCliente) == false)
                    {
                        erro.Erro = 1;
                        erro.Descricao = "O cliente não existe";
                        return erro;
                    }
                    else
                    {

                        PriEngine.Engine.Comercial.Clientes.Remove(codCliente);
                        erro.Erro = 0;
                        erro.Descricao = "Sucesso";
                        return erro;
                    }
                }

                else
                {
                    erro.Erro = 1;
                    erro.Descricao = "Erro ao abrir a empresa";
                    return erro;
                }
            }

            catch (Exception ex)
            {
                erro.Erro = 1;
                erro.Descricao = ex.Message;
                return erro;
            }

        }



        public static Lib_Primavera.Model.RespostaErro InsereClienteObj(Model.Cliente cli)
        {

            Lib_Primavera.Model.RespostaErro erro = new Model.RespostaErro();
            

            GcpBECliente myCli = new GcpBECliente();

            try
            {
                if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
                {

                    myCli.set_Cliente(cli.CodCliente);
                    myCli.set_Nome(cli.NomeCliente);
                    myCli.set_NumContribuinte(cli.NumContribuinte);
              
                    myCli.set_Morada(cli.Morada);

                    PriEngine.Engine.Comercial.Clientes.Actualiza(myCli);

                    erro.Erro = 0;
                    erro.Descricao = "Sucesso";
                    return erro;
                }
                else
                {
                    erro.Erro = 1;
                    erro.Descricao = "Erro ao abrir empresa";
                    return erro;
                }
            }

            catch (Exception ex)
            {
                erro.Erro = 0;
                erro.Descricao = ex.Message;
                return erro;
            }


        }

       

        #endregion Cliente;   // -----------------------------  END   CLIENTE    -----------------------


        #region Artigo

        public static Lib_Primavera.Model.Artigo GetArtigo(string codArtigo)
        {
            
            GcpBEArtigo objArtigo = new GcpBEArtigo();
            Model.Artigo myArt = new Model.Artigo();
            Model.Stock stockEle;

            StdBELista objList;
            List<Model.Stock> liststock;

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                if (PriEngine.Engine.Comercial.Artigos.Existe(codArtigo) == false)
                {
                    return null;
                }
                else
                {
                    objArtigo = PriEngine.Engine.Comercial.Artigos.Edita(codArtigo);
                    myArt.CodArtigo = objArtigo.get_Artigo();
                    myArt.NomeArtigo = objArtigo.get_Descricao();
                    myArt.Desconto = objArtigo.get_Desconto();
                    StdBELista listapreco = PriEngine.Engine.Consulta("SELECT ISNULL(PVP1, 0) as Preco FROM ArtigoMoeda WHERE Moeda='EUR' AND Artigo='" + codArtigo + "'");

                    if (!listapreco.Vazia())
                        myArt.Preco = listapreco.Valor("Preco");
                    else
                        myArt.Preco = 0;

                    objList = PriEngine.Engine.Consulta("SELECT Localidade, sum(StkActual) as unidades, Armazens.Armazem as armazemID FROM ArtigoArmazem, Armazens WHERE ArtigoArmazem.Armazem = Armazens.Armazem AND Artigo ='" + codArtigo + "' Group By Armazens.Armazem, Localidade, Artigo");

                    liststock = new List<Model.Stock>();

                    while (!objList.NoFim())
                    {
                        stockEle = new Model.Stock();
                       
                        stockEle.loja = objList.Valor("Localidade");
                        stockEle.unidades = objList.Valor("unidades");
                        stockEle.armazemID = objList.Valor("armazemID");

                        liststock.Add(stockEle);
                        objList.Seguinte();
                    }

                    myArt.StockExistente = liststock;

                    return myArt;
                }
                
            }
            else
            {
                return null;
            }

        }

        public static List<Model.Artigo> ListaArtigos()
        {
                        
            StdBELista objList;

            Model.Artigo art = new Model.Artigo();
            List<Model.Artigo> listArts = new List<Model.Artigo>();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                objList = PriEngine.Engine.Comercial.Artigos.LstArtigos();

                while (!objList.NoFim())
                {
                    art = new Model.Artigo();
                    art.CodArtigo = objList.Valor("artigo");
                    art.NomeArtigo = objList.Valor("descricao");
                    
                    
                    listArts.Add(art);
                    objList.Seguinte();
                }

                return listArts;

            }
            else
            {
                return null;

            }

        }


        public static Model.BestSellers ListaBestSellers()
        {

            StdBELista tmpListBestSellers;

            Model.BestSellers bestSellers = new Model.BestSellers();
            List<Model.BestSeller> listBestSellers = new List<Model.BestSeller>();
            Model.BestSeller bestSeller = new Model.BestSeller();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                tmpListBestSellers = PriEngine.Engine.Consulta("SELECT TOP 5 LinhasDoc.Artigo as Artigo, LinhasDoc.Descricao as Nome, SUM(LinhasDoc.PrecUnit * LinhasDoc.Quantidade) AS NumeroVendas FROM LinhasDoc,CabecDoc WHERE IdCabecDoc = CabecDoc.Id AND TipoDoc='Fa' GROUP BY Artigo, Descricao ORDER BY NumeroVendas DESC");

                int totalVendas = 0;
                while (!tmpListBestSellers.NoFim())
                {
                    bestSeller = new Model.BestSeller();
                    bestSeller.CodArtigo = tmpListBestSellers.Valor("Artigo");
                    bestSeller.NomeArtigo = tmpListBestSellers.Valor("Nome");
                    bestSeller.QuantiaVendas = Math.Round(tmpListBestSellers.Valor("NumeroVendas"), 2);

                    listBestSellers.Add(bestSeller);
                    tmpListBestSellers.Seguinte();
                }

                bestSellers.BestSellersLista = listBestSellers;

                StdBELista tmpObjList = PriEngine.Engine.Consulta("SELECT SUM(LinhasDoc.PrecUnit * LinhasDoc.Quantidade) AS TotalVendas FROM LinhasDoc,CabecDoc WHERE IdCabecDoc = CabecDoc.Id AND TipoDoc='Fa'");
                if(!tmpObjList.NoFim())
                    bestSellers.TotalVendas = Math.Round(tmpObjList.Valor("TotalVendas"), 2);

                return bestSellers;

            }
            else
            {
                return null;

            }      
        }


        public static List<Model.Artigo> ListaMelhoresDescontos()
        {
            StdBELista listDescontos;

            List<Model.Artigo> melhoresDescontos = new List<Model.Artigo>();

            Model.Artigo artigo = new Model.Artigo();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                listDescontos = PriEngine.Engine.Consulta("SELECT TOP 5 descricao as Nome, Artigo.Artigo as CodArtigo, Desconto, PVP1  as Preco FROM Artigo, ArtigoMoeda WHERE Artigo.Artigo = ArtigoMoeda.Artigo AND Moeda='EUR' ORDER BY Desconto DESC");

                while (!listDescontos.NoFim())
                {
                    artigo = new Model.Artigo();
                    artigo.CodArtigo = listDescontos.Valor("CodArtigo");
                    artigo.NomeArtigo = listDescontos.Valor("Nome");
                    artigo.Desconto = listDescontos.Valor("Desconto");
                    artigo.Preco = listDescontos.Valor("Preco");

                    melhoresDescontos.Add(artigo);
                    listDescontos.Seguinte();
                }

                return melhoresDescontos;

            }
            else
            {
                return null;

            }      

        }

        #endregion Artigo

        #region Plataforma

        public static List<Model.Plataforma> ListaVendasPorPlataforma()
        {
            StdBELista objList;

            List<Model.Plataforma> plataformas = new List<Model.Plataforma>();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {
                objList = PriEngine.Engine.Consulta("SELECT Descricao as Categoria, NumeroVendas FROM Familias, (SELECT Familia as CategoriaID, SUM(LinhasDoc.PrecUnit * LinhasDoc.Quantidade) AS NumeroVendas FROM LinhasDoc,CabecDoc,Artigo WHERE IdCabecDoc = CabecDoc.Id And LinhasDoc.Artigo = Artigo.Artigo AND TipoDoc='Fa' GROUP BY Familia) as PlatVendas WHERE CategoriaID = Familia ORDER BY NumeroVendas DESC");

                while (!objList.NoFim())
                {

                    plataformas.Add(new Model.Plataforma
                    {
                        Categoria = objList.Valor("Categoria"),
                       QuantiaVendas = Math.Round(objList.Valor("NumeroVendas"), 2)
                    });
                    objList.Seguinte();
                }
                return plataformas;
            }
            else
            {
                return null;

            }      
     }


        #endregion Plataforma

        #region Cron




        #endregion Cron

        public static Model.UpdateDatabase syncronize()
        {
            StdBELista objList;

            List<Model.Familia> familias = new List<Model.Familia>();
            List<Model.Armazem> armazens = new List<Model.Armazem>();
            List<Model.Cliente> clientes = new List<Model.Cliente>();
            List<Model.Artigo> artigos = new List<Model.Artigo>();

            Model.UpdateDatabase syncronizedData = new Model.UpdateDatabase();

            Model.Familia familia = new Model.Familia();
            Model.Armazem armazem = new Model.Armazem();
            Model.Cliente cliente = new Model.Cliente();
           

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                //Familias

                string st = "SELECT Familia, Descricao FROM Familias";
                objList = PriEngine.Engine.Consulta(st);


                while (!objList.NoFim())
                {
                    familia = new Model.Familia();
                    familia.Id = objList.Valor("Familia");
                    familia.Nome = objList.Valor("Descricao");

                    familias.Add(familia);

                    objList.Seguinte();
                }

                syncronizedData.Familias = familias;

                //Armazens

                st = "SELECT Armazem as Id, Descricao as Localidade FROM Armazens WHERE Armazem != 'CMP'";
                objList = PriEngine.Engine.Consulta(st);

                while (!objList.NoFim())
                {
                    armazem = new Model.Armazem();
                    armazem.Id = objList.Valor("Id");
                    armazem.Localidade = objList.Valor("Localidade");

                    armazens.Add(armazem);

                    objList.Seguinte();
                }

                syncronizedData.Armazens = armazens;

                //clientes

                st = "SELECT Cliente as Username, Nome, Fac_Mor as Morada, Fac_Local as Localidade, NumContrib as Nif, Fac_Cp as Cpostal FROM Clientes";
                objList = PriEngine.Engine.Consulta(st);

                while (!objList.NoFim())
                {
                    cliente = new Model.Cliente();
                    cliente.CodCliente = objList.Valor("Username");
                    cliente.NomeCliente = objList.Valor("Nome");
                    cliente.Morada = objList.Valor("Morada");
                    cliente.Localidade = objList.Valor("Localidade");
                    cliente.NumContribuinte = objList.Valor("Nif");
                    cliente.Cpostal = objList.Valor("Cpostal");
               

                    clientes.Add(cliente);

                    objList.Seguinte();
                }

                syncronizedData.Clientes = clientes;


                // Artigos

                st = "SELECT Artigo as CodArtigo, Familia from Artigo";
                objList = PriEngine.Engine.Consulta(st);

                Model.Stock stockEle;

                List<Model.Stock> liststock;

                while (!objList.NoFim())
                {
                    Model.Artigo artigo = new Model.Artigo();
                    GcpBEArtigo objArtigo = new GcpBEArtigo();
                    string cod = objList.Valor("CodArtigo");
                    objArtigo = PriEngine.Engine.Comercial.Artigos.Edita(cod);
                    artigo.CodArtigo = objArtigo.get_Artigo();
                    artigo.NomeArtigo = objArtigo.get_Descricao();
                    artigo.Desconto = objArtigo.get_Desconto();
                    artigo.Familia = objArtigo.get_Familia();
                    StdBELista listapreco = PriEngine.Engine.Consulta("SELECT ISNULL(PVP1, 0) as Preco FROM ArtigoMoeda WHERE Moeda='EUR' AND Artigo='" + cod + "'");

                    if (!listapreco.Vazia())
                        artigo.Preco = listapreco.Valor("Preco");
                    else
                        artigo.Preco = 0;
                    StdBELista objList1 = PriEngine.Engine.Consulta("SELECT Localidade, sum(StkActual) as unidades, Armazens.Armazem as armazemID FROM ArtigoArmazem, Armazens WHERE ArtigoArmazem.Armazem = Armazens.Armazem AND Artigo ='" + cod + "' Group By Armazens.Armazem, Localidade, Artigo");

                    liststock = new List<Model.Stock>();

                    while (!objList1.NoFim())
                    {
                        stockEle = new Model.Stock();

                        stockEle.loja = objList1.Valor("Localidade");
                        stockEle.unidades = objList1.Valor("unidades");
                        stockEle.armazemID = objList1.Valor("armazemID");

                        liststock.Add(stockEle);
                        objList1.Seguinte();
                    }

                    artigo.StockExistente = liststock;

                    artigos.Add(artigo);

                    objList.Seguinte();
                }

                syncronizedData.Artigos = artigos;
               
                return syncronizedData;
            }
            else
            {
                return null;
            }  
        }

        #region Ganhos

        public static Model.Ganhos GetGanhos(string year, string month)
        {
            StdBELista ganhoAtual;
            StdBELista objListGanhosMA;

            Model.Ganhos ganhos = new Model.Ganhos();
            List<Model.GanhosMes> listGMA = new List<Model.GanhosMes>();
            Model.GanhosMes ganhosMes = new Model.GanhosMes();


            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                ganhoAtual = PriEngine.Engine.Consulta("SELECT ISNULL(SUM(LinhasDoc.PrecUnit * LinhasDoc.Quantidade), 0) AS GanhoAtual FROM LinhasDoc,CabecDoc WHERE IdCabecDoc = CabecDoc.Id AND TipoDoc='Fa' AND YEAR(CabecDoc.Data) = '" + year + "' AND MONTH(CabecDoc.Data)='" + month + "'");

                if (!ganhoAtual.NoFim())
                    ganhos.GanhoVendasAtual = Math.Round(ganhoAtual.Valor("GanhoAtual"), 2);
                else
                    ganhos.GanhoVendasAtual = 0;



                objListGanhosMA = PriEngine.Engine.Consulta("SELECT TOP 3 ISNULL(SUM(LinhasDoc.PrecUnit * LinhasDoc.Quantidade), 0) AS NumeroVendas, YEAR(CabecDoc.Data) as Ano, MONTH(CabecDoc.Data) as Mes FROM LinhasDoc,CabecDoc WHERE IdCabecDoc = CabecDoc.Id AND TipoDoc='Fa' AND CabecDoc.Data < CONVERT(varchar, '" + year + "/" + month + "/" + "1" + "', 102) GROUP BY YEAR(CabecDoc.Data), MONTH(CabecDoc.Data) ORDER BY max(CabecDoc.Data) DESC");

                while (!objListGanhosMA.NoFim())
                {
                    ganhosMes = new Model.GanhosMes();
                    ganhosMes.Ano = objListGanhosMA.Valor("Ano");
                    ganhosMes.Mes = objListGanhosMA.Valor("Mes");
                    ganhosMes.Vendas = Math.Round(objListGanhosMA.Valor("NumeroVendas"), 2);

                    listGMA.Add(ganhosMes);
                    objListGanhosMA.Seguinte();
                }

                ganhos.GanhosMesesAnt = listGMA;

                return ganhos;

            }
            else
            {
                return null;

            }      
        }

        #endregion Ganhos

        #region Pesquisa
    
        public static List<Model.Artigo> ListaResultadosPesquisa(string algo)
        {

            StdBELista objList;
            StdBELista objListSec;

            List<Model.Artigo> resultados = new List<Model.Artigo>();
            Model.Artigo artigo = new Model.Artigo();
            List<Model.Stock> liststock;
            Model.Stock stockEle = new Model.Stock();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                
                string st = "SELECT Artigo.descricao AS NomeArtigo, Artigo, StkActual, Desconto, Artigo as artigoID FROM Artigo, Familias WHERE Artigo.Familia = Familias.Familia AND Artigo.descricao LIKE '%" + algo + "%' OR Familias.Descricao LIKE '%" + algo + "%'";
                objList = PriEngine.Engine.Consulta(st);


                while(!objList.NoFim())
                {
                    artigo = new Model.Artigo();
                    artigo.CodArtigo = objList.Valor("artigoID");
                    artigo.NomeArtigo = objList.Valor("NomeArtigo");
                    artigo.Desconto = objList.Valor("Desconto");
                    

                    string st2 = "SELECT ISNULL(PVP1, 0) as Preco FROM ArtigoMoeda WHERE Artigo ='" + artigo.CodArtigo + "' AND  Moeda='EUR'";
                    objListSec = PriEngine.Engine.Consulta(st2);

                    if(!objListSec.NoFim())
                        artigo.Preco = objListSec.Valor("Preco");
                    else
                        artigo.Preco = 0;

                   
                    resultados.Add(artigo);

                    objList.Seguinte();
                }

                return resultados;

            }
            else
            {
                return null;

            }  






        }


        #endregion Pesquisa

        #region DocCompra


        public static List<Model.DocCompra> VGR_List()
        {
                
            StdBELista objListCab;
            StdBELista objListLin;
            Model.DocCompra dc = new Model.DocCompra();
            List<Model.DocCompra> listdc = new List<Model.DocCompra>();
            Model.LinhaDocCompra lindc = new Model.LinhaDocCompra();
            List<Model.LinhaDocCompra> listlindc = new List<Model.LinhaDocCompra>();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {
                objListCab = PriEngine.Engine.Consulta("SELECT id, NumDocExterno, Entidade, DataDoc, NumDoc, TotalMerc, Serie From CabecCompras where TipoDoc='VGR'");
                while (!objListCab.NoFim())
                {
                    dc = new Model.DocCompra();
                    dc.id = objListCab.Valor("id");
                    dc.NumDocExterno = objListCab.Valor("NumDocExterno");
                    dc.Entidade = objListCab.Valor("Entidade");
                    dc.NumDoc = objListCab.Valor("NumDoc");
                    dc.Data = objListCab.Valor("DataDoc");
                    dc.TotalMerc = objListCab.Valor("TotalMerc");
                    dc.Serie = objListCab.Valor("Serie");
                    objListLin = PriEngine.Engine.Consulta("SELECT idCabecCompras, Artigo, Descricao, Quantidade, Unidade, PrecUnit, Desconto1, TotalILiquido, PrecoLiquido, Armazem, Lote from LinhasCompras where IdCabecCompras='" + dc.id + "' order By NumLinha");
                    listlindc = new List<Model.LinhaDocCompra>();

                    while (!objListLin.NoFim())
                    {
                        lindc = new Model.LinhaDocCompra();
                        lindc.IdCabecDoc = objListLin.Valor("idCabecCompras");
                        lindc.CodArtigo = objListLin.Valor("Artigo");
                        lindc.DescArtigo = objListLin.Valor("Descricao");
                        lindc.Quantidade = objListLin.Valor("Quantidade");
                        lindc.Unidade = objListLin.Valor("Unidade");
                        lindc.Desconto = objListLin.Valor("Desconto1");
                        lindc.PrecoUnitario = objListLin.Valor("PrecUnit");
                        lindc.TotalILiquido = objListLin.Valor("TotalILiquido");
                        lindc.TotalLiquido = objListLin.Valor("PrecoLiquido");
                        lindc.Armazem = objListLin.Valor("Armazem");
                        lindc.Lote = objListLin.Valor("Lote");

                        listlindc.Add(lindc);
                        objListLin.Seguinte();
                    }

                    dc.LinhasDoc = listlindc;
                    
                    listdc.Add(dc);
                    objListCab.Seguinte();
                }
            }
            return listdc;
        }

                
        public static Model.RespostaErro VGR_New(Model.DocCompra dc)
        {
            Lib_Primavera.Model.RespostaErro erro = new Model.RespostaErro();
            

            GcpBEDocumentoCompra myGR = new GcpBEDocumentoCompra();
            GcpBELinhaDocumentoCompra myLin = new GcpBELinhaDocumentoCompra();
            GcpBELinhasDocumentoCompra myLinhas = new GcpBELinhasDocumentoCompra();

            PreencheRelacaoCompras rl = new PreencheRelacaoCompras();
            List<Model.LinhaDocCompra> lstlindv = new List<Model.LinhaDocCompra>();

            try
            {
                if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
                {
                    // Atribui valores ao cabecalho do doc
                    //myEnc.set_DataDoc(dv.Data);
                    myGR.set_Entidade(dc.Entidade);
                    myGR.set_NumDocExterno(dc.NumDocExterno);
                    myGR.set_Serie(dc.Serie);
                    myGR.set_Tipodoc("VGR");
                    myGR.set_TipoEntidade("F");
                    // Linhas do documento para a lista de linhas
                    lstlindv = dc.LinhasDoc;
                    //PriEngine.Engine.Comercial.Compras.PreencheDadosRelacionados(myGR,rl);
                    PriEngine.Engine.Comercial.Compras.PreencheDadosRelacionados(myGR);
                    foreach (Model.LinhaDocCompra lin in lstlindv)
                    {
                        PriEngine.Engine.Comercial.Compras.AdicionaLinha(myGR, lin.CodArtigo, lin.Quantidade, lin.Armazem, "", lin.PrecoUnitario, lin.Desconto);
                    }


                    PriEngine.Engine.IniciaTransaccao();
                    PriEngine.Engine.Comercial.Compras.Actualiza(myGR, "Teste");
                    PriEngine.Engine.TerminaTransaccao();
                    erro.Erro = 0;
                    erro.Descricao = "Sucesso";
                    return erro;
                }
                else
                {
                    erro.Erro = 1;
                    erro.Descricao = "Erro ao abrir empresa";
                    return erro;

                }

            }
            catch (Exception ex)
            {
                PriEngine.Engine.DesfazTransaccao();
                erro.Erro = 1;
                erro.Descricao = ex.Message;
                return erro;
            }
        }


        #endregion DocCompra


        #region DocsVenda

        public static Model.RespostaErro Encomendas_New(Model.DocVenda dv)
        {
            Lib_Primavera.Model.RespostaErro erro = new Model.RespostaErro();
            GcpBEDocumentoVenda myEnc = new GcpBEDocumentoVenda();
             
            GcpBELinhaDocumentoVenda myLin = new GcpBELinhaDocumentoVenda();

            GcpBELinhasDocumentoVenda myLinhas = new GcpBELinhasDocumentoVenda();
           
            List<Model.LinhaDocVenda> lstlindv = new List<Model.LinhaDocVenda>();


            GcpBECliente myCli = new GcpBECliente();
       
           
            try
            {
                if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
                {
                    Model.Cliente cliente = dv.Cliente;
                    //cria ou atualiza cliente
                    Boolean clienteExiste = PriEngine.Engine.Comercial.Clientes.Existe(cliente.CodCliente);
                    if (clienteExiste == false)
                    {
                        myCli.set_Cliente(cliente.CodCliente);
                        
                        myCli.set_Nome(cliente.NomeCliente);
                        myCli.set_NumContribuinte(cliente.NumContribuinte);
                        myCli.set_Morada(cliente.Morada);
                        myCli.set_CodigoPostal(cliente.Cpostal);
                        myCli.set_Localidade(cliente.Localidade);
                        
                        myCli.set_CondPag("1");
                        myCli.set_ModoPag("DEP");
                        myCli.set_ModoRec("DEP");

                        myCli.set_Moeda("EUR");

                        PriEngine.Engine.IniciaTransaccao();
                        PriEngine.Engine.Comercial.Clientes.Actualiza(myCli);
                        PriEngine.Engine.TerminaTransaccao(); 
                    }


                    //cria encomenda
                    myEnc.set_Entidade(cliente.CodCliente);
                    
                    myEnc.set_Tipodoc("ECL");
                    myEnc.set_TipoEntidade("C");
                    myEnc.set_Serie(dv.Serie);


                    // Linhas do documento para a lista de linhas
                    lstlindv = dv.LinhasDoc;
                    
                    PriEngine.Engine.Comercial.Vendas.PreencheDadosRelacionados(myEnc);

                    foreach (Model.LinhaDocVenda lin in lstlindv)
                    {
                        PriEngine.Engine.Comercial.Vendas.AdicionaLinha(myEnc, lin.CodArtigo, lin.Quantidade, "", "", lin.PrecoUnitario, lin.Desconto);
                    }

                    PriEngine.Engine.IniciaTransaccao();
                    PriEngine.Engine.Comercial.Vendas.Actualiza(myEnc, "Teste");
                    PriEngine.Engine.TerminaTransaccao(); 

                    
                    erro.Erro = 0;
                    erro.Descricao = "Sucesso";
                    return erro;
                }
                else
                {
                    erro.Erro = 1;
                    erro.Descricao = "Erro ao abrir empresa";
                    return erro;

                }

            }
            catch (Exception ex)
            {
                PriEngine.Engine.DesfazTransaccao();
                erro.Erro = 1;
                erro.Descricao = ex.Message;
                return erro;
            }
        }

     

        public static List<Model.Encomenda> Encomendas_List(string cliente)
        {
            
            StdBELista objListCab;
            Model.Encomenda dv = new Model.Encomenda();
            List<Model.Encomenda> listdv = new List<Model.Encomenda>();

            StdBELista objListEs;

            Model.EstadoEncomenda lindec = new Model.EstadoEncomenda();


            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {
                objListCab = PriEngine.Engine.Consulta("SELECT NumDoc, Serie, max(Data) as Data, max(HoraCarga) as Hora   From CabecDoc,CabecDocStatus where IdCabecDoc=Id AND Entidade='" + cliente + "' AND TipoDoc = 'ECL' Group By NumDoc, Serie ORDER BY  Data DESC, Hora DESC");
                while (!objListCab.NoFim())
                {
                    dv = new Model.Encomenda();
                    dv.NumDoc = objListCab.Valor("NumDoc");
                    dv.Serie = objListCab.Valor("Serie");
                    dv.Data = objListCab.Valor("Data");
                    dv.Horas = objListCab.Valor("Hora");
                    int numDoc = objListCab.Valor("NumDoc");




                    string st3 = "SELECT TOP 1 TipoDoc, Data, HoraCarga, Estado FROM CabecDOc, CabecDocStatus WHERE id=IdCabecDoc AND NumDoc='" + numDoc + "' AND Entidade ='" + cliente + "' Order By Data DESC, HoraCarga DESC";
                    objListEs = PriEngine.Engine.Consulta(st3);

                    lindec = new Model.EstadoEncomenda();

                   if (!objListEs.NoFim())
                    {
                        
                        lindec.tipoDoc = objListEs.Valor("TipoDoc");
                        lindec.data = objListEs.Valor("Data");
                        lindec.Estado = objListEs.Valor("Estado");
                    }

                    dv.Estado = lindec;


                    listdv.Add(dv);
                    objListCab.Seguinte();
                }   
            }
            return listdv;
        }




        public static Model.EncomendaDetalhes Encomenda_Get(string idCliente, string serie, string numDoc)
        {

            StdBELista objListAux;
            StdBELista objListLin;
            StdBELista objListCab;
           


            Model.EncomendaDetalhes enc = new Model.EncomendaDetalhes();
            Model.DetalhesCompraArtigo lindv = new Model.DetalhesCompraArtigo();
            Model.EstadoEncomenda lindec = new Model.EstadoEncomenda();

            List<Model.DetalhesCompraArtigo> listlindv = new List<Model.DetalhesCompraArtigo>();
            List<Model.EstadoEncomenda> listlindec = new List<Model.EstadoEncomenda>();

            if (PriEngine.InitializeCompany(FirstREST.Properties.Settings.Default.Company.Trim(), FirstREST.Properties.Settings.Default.User.Trim(), FirstREST.Properties.Settings.Default.Password.Trim()) == true)
            {

                string st1 = "SELECT TOP 1 id, Data as DataCriacao,HoraCarga as Horas From CabecDoc where TipoDoc='ECL' AND serie='" + serie + "' AND numDoc='"+ numDoc + "' AND Entidade ='" + idCliente + "' ORDER BY  DataCriacao DESC, Horas DESC";
                objListAux = PriEngine.Engine.Consulta(st1);

                string encRef;
                if (!objListAux.NoFim())
                {
                    enc.dataCriacao = objListAux.Valor("DataCriacao");
                    enc.Horas = objListAux.Valor("Horas");
                    encRef = objListAux.Valor("id");
                }
                else
                    return enc;

                string st2 = "SELECT idArtigo, Descricao as NomeArtigo, Categoria, Quantidade, Desconto1 as Desconto, PrecoLiquido as Preco, TaxaIva as Iva from LinhasDoc, (SELECT Familias.Descricao as categoria, Artigo as idArtigo FROM Familias, Artigo WHERE Artigo.Familia = Familias.Familia) as Categoria where idArtigo = Artigo AND IdCabecDoc='" + encRef + "' order By NumLinha ";
                objListLin = PriEngine.Engine.Consulta(st2);
                listlindv = new List<Model.DetalhesCompraArtigo>();

                while (!objListLin.NoFim())
                {
                    lindv = new Model.DetalhesCompraArtigo();
                    lindv.codArtigo = objListLin.Valor("idArtigo");
                    lindv.nomeArtigo = objListLin.Valor("nomeArtigo");
                    lindv.categoria = objListLin.Valor("categoria");
                    lindv.quantidade = objListLin.Valor("Quantidade");
                    lindv.precoLiquido = objListLin.Valor("Preco");
                    lindv.iva = objListLin.Valor("Iva");
                    listlindv.Add(lindv);
                    objListLin.Seguinte();
                }

                enc.artigos = listlindv;

                string st3 = "SELECT TipoDoc, Data, HoraCarga as Horas, Estado FROM CabecDoc, CabecDocStatus WHERE id=IdCabecDoc AND NumDoc='" + numDoc + "' AND Entidade ='" + idCliente + "' Order By Data DESC, Horas DESC";
                objListCab = PriEngine.Engine.Consulta(st3);


                listlindec = new List<Model.EstadoEncomenda>();

                while (!objListCab.NoFim())
                {
                    lindec = new Model.EstadoEncomenda();
                    lindec.tipoDoc = objListCab.Valor("TipoDoc");
                    lindec.data = objListCab.Valor("Data");
                    lindec.Horas = objListCab.Valor("Horas");
                    lindec.Estado = objListCab.Valor("Estado");
                  
                    listlindec.Add(lindec);
                    objListCab.Seguinte();
                }

                enc.estados = listlindec;
                return enc;
            }
            return null;
        }

        #endregion DocsVenda
    }
}