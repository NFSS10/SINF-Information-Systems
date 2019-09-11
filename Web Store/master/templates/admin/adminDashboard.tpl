{include file='common/header.tpl'}

<script src="//code.highcharts.com/highcharts.js"></script>
<script src="//code.highcharts.com/modules/exporting.js"></script>
<script src="{$BASE_URL}javascript/adminCharts.js"></script>
<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/adminDashboard.css">

<div class="container-fluid" id="all-content">
    <div class="row">
        <div class="col-md-3">
            {include file='admin/adminSidebar.tpl'}
        </div>
        <div class="admin-content">
            <div class="row" id="graphs">
                <div class="col-lg-12">
                    <h2>Data analysis</h2>
                    <hr class="half-rule-usersRecentes"/>
                </div>
            </div>
                <div class="row justify-content-center">
                    <div class="col-md-4 col-centered">
                        <div id="graph" class="graph"></div>
                    </div>
                    <div class="col-md-4 col-centered">
                        <div id="graph2" class="graph"></div>
                    </div>
                    <div class="col-md-4 col-centered">
                        <div id="graph3" class="graph"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{include file='common/footer.tpl'}
