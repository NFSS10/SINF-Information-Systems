{include file='common/header.tpl'}

<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/my_orders.css">
<script src="{$BASE_URL}javascript/my_orders.js"></script>

<div class="container">
    <div class="breadcrumb_container">
        <ul class="breadcrumb">
            <li><a href="#">My account</a></li>
            <li class="active">Purchases</li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-4 sidebar1">
            <div class="account_panel_header">
                <h2><strong>My Account</strong></h2>
            </div>
            <br>
            <div class="left-navigation">
                <ul class="my_account_list">
                    <li><a href="{$BASE_URL}pages/users/profile.php">Account details</a></li>
                    <li><a href="{$BASE_URL}pages/users/my_orders.php">Purchases</a></li>
                    <li><a href="{$BASE_URL}pages/users/favorites.php">Wish list</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 col-sm-8 main-content" id="my_orders_content">

            <table class="my_orders table-responsive">
                <thead>
                <tr>
                    <th><h1># Order Ref</h1></th>
                    <th><h1>Date</h1></th>
                    <th><h1>Last Status</h1></th>
                </tr>
                </thead>
                <tbody>
                {foreach $orders as $key => $order}
                <tr>
                    <td><a href="{$BASE_URL}pages/users/order_status.php?serie={$order.Serie}&ndoc={$order.NumDoc}">{$order.OrderNumber}</a></td>
                    <td>{$order.Data}</td>
                    <td class="{$order.Cor}">{$order.Informacao}</td>
                </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}