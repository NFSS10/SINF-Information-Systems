$(document).ready(function () {
    getBestSellers();
    getMonthEarnings();
    getMostProfitablePlataforms();
});
	
function getBestSellers()
{
    $.getJSON(PRIMAVERA_IP+":44300/api/artigos/bestsellers", function( data ) {

        bestSellers = [];
        for(var i = 0; i < data.BestSellersLista.length;i++)
        {
            var bestseller = {
                name: data.BestSellersLista[i].CodArtigo,
                data: [data.BestSellersLista[i].QuantiaVendas]
            };

            bestSellers.push(bestseller);
        }

        $('#graph').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Best Sellers'
            },
            xAxis: {

            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Money (€)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} €</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },


            series: bestSellers
        });
    });
}

function getMonthEarnings()
{
    var d = new Date();
    var year = d.getFullYear();
    var month = d.getMonth() + 1;

    $.getJSON(PRIMAVERA_IP+":44300/api/ganhos/" + year + "/" + month, function( data ) {

        monthEarnings = [{
                    name: month+"/"+year,
                    data: [data.GanhoVendasAtual]
        }];
        for(var i = 0; i < data.GanhosMesesAnt.length;i++)
        {
            var ganhos = {
                name: data.GanhosMesesAnt[i].Mes + "/" + data.GanhosMesesAnt[i].Ano ,
                data: [data.GanhosMesesAnt[i].Vendas]
            };

            monthEarnings.push(ganhos);
        }

        $('#graph2').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Month Earnings'
            },
            xAxis: {

            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Earnings (€)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} €</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: monthEarnings
        });


    });


}

function getMostProfitablePlataforms(){

    $.getJSON(PRIMAVERA_IP+":44300/api/plataformas", function( data ) {

        var mostProfitablePlataforms = [];

        for(var i = 0; i < data.length; i++)
        {
            var plataform = {
                name: data[i].Categoria,
                y: data[i].QuantiaVendas
            };
            mostProfitablePlataforms.push(plataform);
        }

        $('#graph3').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Most profitable plataforms'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: mostProfitablePlataforms
            }]
        });

    });

}
	
