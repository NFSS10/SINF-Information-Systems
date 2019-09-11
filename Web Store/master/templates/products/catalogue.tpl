{include file='common/header.tpl'}

<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/catalogue.css">
<script src="{$BASE_URL}javascript/slider.js"></script>

<div class="container" id="homepage_catalogue">

    <div class="row">

        <div class="col-lg-12">

            <div class="carousel slide my-4" data-ride="carousel" id="catalogue_carrousel">
                <div class="carousel-inner" role="listbox">
                    {for $count = 0 to (count($newest_products)-1)}
                        {if $count == 0}
                            <div class="carousel-item active item">
                                <a href="{$BASE_URL}pages/products/search_results.php/?query={$newest_products[$count]['nome']}">
                                <img class="d-block" src="{$BASE_URL}{$newest_products[$count]['imagemdestaque']}">
                                </a>
                            </div>
                        {else}
                            <div class="carousel-item item">
                                <a href="{$BASE_URL}pages/products/search_results.php/?query={$newest_products[$count]['nome']}">
                                    <img class="d-block" src="{$BASE_URL}{$newest_products[$count]['imagemdestaque']}">
                                </a>
                            </div>
                        {/if}
                    {/for}
                </div>

                <a class="carousel-control-prev" href="#catalogue_carrousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#catalogue_carrousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div class="container-fluid" id="showcase">
                <div class="row" id="products_header">
                    <div class="header_best_products col-md-3 col-sm-6">
                        <h2>Best Products</h2>
                    </div>
                    <div class="col-md-3 text-md-right lead">
                        <a class="btn btn-outline-secondary" id="bestp_prev" href="" title="go back">
                            <i class="fa fa-lg fa-chevron-left"></i></a>
                        <a class="btn btn-outline-secondary" id="bestp_next" href="" title="more">
                            <i class="fa fa-lg fa-chevron-right"></i></a>
                    </div>
                </div>

                <div class="container-fluid" id="best_products">
                    <div class="carousel slide" data-ride="carousel" data-interval="4000"
                         id="best_products_carrousel">
                        <div class="carousel-inner row w-100 " role="listbox">
                            {foreach $topten as $key => $product}
                                <div class="carousel-item col-md-3">
                                    <div class="card h-70">
                                        <a href="{$BASE_URL}pages/products/product.php?id={$product['idproduto']}"><img
                                                    class="card-img-top" src={$BASE_URL}{$product['imagem']} alt=""></a>
                                        <div class="card-body best_products_card_body">
                                            <h5 class="card-title">
                                                <a href="{$BASE_URL}pages/products/product.php?id={$product['idproduto']}"
                                                   class="best_product_name"> {$product['nome']}</a>
                                            </h5>
                                            {for $count=1 to 5}
                                                {if $count <= {$product['pontuacao']}}
                                                    <span class="fa fa-star checked"></span>
                                                {else}
                                                    <span class="fa fa-star"></span>
                                                {/if}
                                            {/for}
                                            <h5 class="best_product_price">{$product['preco']} €</h5>
                                        </div>
                                        <div class="card-footer">
                                            <button name="{$product['idproduto']}" type="button"
                                                    class="btn btn-danger btn-lg btn-block add_to_cart"{if $product['stkatual'] == 0}disabled{/if}><i
                                                        class="fa fa-shopping-cart" aria-hidden="true"> </i> Add to
                                                cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                </div>


                <!-- Best discounts -->

                <div class="row" id="sales_header">
                    <div class="header_on_sale_products col-md-3 col-sm-6">
                        <h2>Promotions</h2>
                    </div>
                    <div class="col-md-3 text-md-right lead">
                        <a class="btn btn-outline-secondary" id="sales_prev" href="" title="go back"><i
                                    class="fa fa-lg fa-chevron-left"></i></a>
                        <a class="btn btn-outline-secondary" id="sales_next" href="" title="more"><i
                                    class="fa fa-lg fa-chevron-right"></i></a>
                    </div>
                </div>

                <div class="container-fluid" id="sales_products">
                    <div id="sales_carousel" class="carousel slide" data-ride="carousel" data-interval="4000">
                        <div class="carousel-inner row w-100 " role="listbox" id="sales_carousel_inner">
                            {foreach $discount_products as $key => $product}
                                <div class="carousel-item col-md-3">
                                    <div class="card h-70">
                                        {if $product['desconto'] > 0}
                                            <span class="sales_badge badge badge-danger"> - {$product['desconto']}
                                                % </span>
                                            <span class="badge badge-warning sales_price_badge">NOW <span
                                                        class="sales_old_price"> {$product['preco']|number_format:2}
                                                    € </span> <span
                                                        class="sales_new_price">{(round($product['preco'] * ((100 - $product['desconto'])/100), 2))|number_format:2}
                                                    €</span></span>
                                        {/if}
                                        <a href="{$BASE_URL}pages/products/product.php?id={$product['idproduto']}"><img
                                                    class="card-img-top"
                                                    src={$BASE_URL}{$product['imagem']} alt=""></a>
                                        <div class="card-body sales_card_body">
                                            <h5 class="card-title">
                                                <a href="{$BASE_URL}pages/products/product.php?id={$product['idproduto']}"
                                                   class="best_product_name"> {$product['nome']}</a>
                                            </h5>
                                            {for $count=1 to 5}
                                                {if $count <= {$product['pontuacao']}}
                                                    <span class="fa fa-star checked"></span>
                                                {else}
                                                    <span class="fa fa-star"></span>
                                                {/if}
                                            {/for}
                                        </div>
                                        <div class="card-footer">
                                            <button name="{$product['idproduto']}" type="button"
                                                    class="btn btn-danger btn-lg btn-block add_to_cart" {if $product['stkatual'] == 0}disabled{/if}><i
                                                        class="fa fa-shopping-cart" aria-hidden="true"> </i> Add to
                                                cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='common/footer.tpl'}