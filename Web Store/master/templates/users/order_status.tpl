{include file='common/header.tpl'}

<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/order_status.css">
<script src="{$BASE_URL}javascript/order_status.js"></script>

<div class="container">
    <div class="breadcrumb_container">
        <ul class="breadcrumb">
            <li><a href="#">My Account</a></li>
            <li><a href="{$BASE_URL}pages/users/my_orders.php">My Orders</a></li>
            <li class="active">Order Reference #{$order_id}</li>
        </ul>
    </div>
    <h3 class="order_status_title">Order Reference #{$order_id}</h3>

    <table class="order-status-table table-responsive">
        <thead>
        <tr>
            <th><h1># Number</h1></th>
            <th><h1>Product</h1></th>
            <th><h1>Category</h1></th>
            <th><h1>Quantity</h1></th>
            <th><h1>Final Price</h1></th>
            <th><h1>Your Review</h1></th>
        </tr>
        </thead>
        <tbody>
        {foreach $order['artigos'] as $key => $item}
            <tr>
                <td>{$key+1}</td>
                <td><a href="{$BASE_URL}pages/products/product.php?id={$item.codArtigo}">{$item.nomeArtigo}</a></td>
                <td>{$item.categoria}</td>
                <td>{$item.quantidade}</td>
                <td>{round($item.precoLiquido + ($item.precoLiquido*$item.iva/100),2)} €</td>
                <td>
                    {if $item.review == "semReview"}
                        <div class="rating" id="{$item.codArtigo}">
                            <span class="ratings" id="5"><span class="fa fa-star"></span></span><span class="ratings" id="4"><span class="fa fa-star"></span></span><span class="ratings" id="3"><span class="fa fa-star"></span></span><span class="ratings" id="2"><span class="fa fa-star"></span></span><span class="ratings" id="1"><span class="fa fa-star"></span></span>
                        </div>
                    {else}
                        {for $count=1 to 5}
                            {if $count <= {$item.review}}
                                <span class="fa fa-star checked"></span>
                            {else}
                                <span class="fa fa-star"></span>
                            {/if}
                        {/for}
                    {/if}
                </td>
            </tr>
        {/foreach}
        </tbody>
    </table>

    <hr class="order_status_hr"/>

    <h4 class="order_status_details">Order Details</h4>

    <div class="order_details col-md-12">
        <div class="well">

            <ul class="list-group">
                <li class="list-group-item">
                    <span class="prefix">Date created:</span>
                    <span class="badge badge-success">{$order.dataCriacao}</span>
                </li>
                <li class="list-group-item">
                    <span class="prefix">Last update:</span>
                    <span class="badge badge-success">{$order.estados[0].data}</span>
                </li>
                <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#order_tracking">Track Order</button>
                <div id="order_tracking" class="collapse">

                    <div class="col-md-12">
                        <table class="table table-bordered break-strong">
                            <tbody>
                                <tr>
                                    <td style="width: 50%">
                                        <strong>Last state:</strong> {$order.estados[0].Informacao}
                                    </td>
                                    <td>
                                        <strong>Date:</strong> {$order.estados[0].data}
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        {if count($order.estados) > 1}
                        <h3><span class="label label-default">Previous states:</span></h3>

                        <div class="result-details">
                            <ul class="des-block">
                                {for $count=1 to count($order.estados)-1}
                                <li>
                                    <div class="track-news clearfix">
                                         <span class="date" data-toggle="tooltip" data-placement="top" title="{$order.estados[$count].data}" data-original-title="{$order.estados[$count].data}">
                                            {if $order.estados[$count].diasPassados == 0 }
                                                Today
                                            {else}
                                                {$order.estados[$count].diasPassados}
                                                {if $order.estados[$count].diasPassados == 1}
                                                    day ago
                                                {else}
                                                    days ago
                                                {/if}
                                            {/if}
                                         </span>
                                         <span class="order_information">
                                             {$order.estados[$count].Informacao}
                                         </span>
                                    </div>
                                </li>
                                {/for}
                            </ul>
                        </div>
                        {/if}
                    </div>
                </div>
            </ul>
        </div>
    </div>
</div>
<script>order_id = "{$order_id}" </script>
{include file='common/footer.tpl'}