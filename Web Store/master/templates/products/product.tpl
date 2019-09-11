{include file='common/header.tpl' title=$product['nome']}

<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/product.css">
<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/catalogue.css">
<script src="{$BASE_URL}javascript/product.js"></script>
<script src="{$BASE_URL}javascript/slider.js"></script>


<div class="container">

    <div class="row">
        <div class="col-md-12">
            <ul class="breadcrumb">
                <li>
                    <a href="{$BASE_URL}">Home</a> <span class="divider">/</span>
                </li>
                <li>
                    <a href="{$BASE_URL}pages/products/search_results.php?platform={$product['idcategoria']}">{$product['categoria']}</a> <span class="divider">/</span>
                </li>
                <li class="active">
                    {$product['nome']}
                </li>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col-md-5">
            <div class="row">
                <div class="product-image-container">
                    <img class="product-image" src={$BASE_URL}{$product['imagem']}>
                </div>
            </div>
        </div>

        <div class="col-md-7">

            <div id="prodTitle">
                <h1>
                    {$product['nome']}
                </h1>
                {for $count=1 to 5}
                    {if $count <= {$review}}
                        <span class="fa fa-star checked"></span>
                    {else}
                        <span class="fa fa-star"></span>
                    {/if}
                {/for}

            </div>

            <div class="section">
                <h6 class="title-price">
                    <small>
                        Price <span class="product-discount-info">{if $product['desconto'] != 0} {$product['desconto']}% off{/if}</span>
                    </small>
                </h6>
                <h3 style="margin-top:0px;">
                {if $product['desconto'] == 0}
                    {$product['preco']} €
                {else}
                    <span class="product-strike">{$product['preco']}</span>
                    {round($product['preco'] * ((100 - $product['desconto'])/100), 2)}€
                {/if}
                    </h3>
            </div>

            <div class="section disponibilidade">
                <h6 class="title-attr"><small>Online store availability</small></h6>
                <div>
                    {if {$existStock} == true}
                    <div class=""><i class="prod_stock_geral fa fa-circle in"></i></div>
                    <h5 style="margin-top:0px;">In stock</h5>
                    {else}
                    <div class=""><i class="prod_stock_geral fa fa-circle out"></i></div>
                    <h5 style="margin-top:0px;">Out of stock</h5>
                    {/if}
                </div>
                <div>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Check stock by store</button>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <span class="modal-title">Stores availability</span>
                                    <button class="close" aria-label="Close" data-dismiss="modal">&times;</button>
                                </div>
                                <div>
                                    {foreach $productStores as $key => $product_store}
                                    <div class="row">
                                        {if {$product_store.unidades} > 0}
                                            <div class="shrink columns bullet"><i class="fa fa-circle in"></i> </div>
                                        {else}
                                            <div class="shrink columns bullet"><i class="fa fa-circle out"></i> </div>
                                        {/if}
                                        <div class="columns">
                                            <span class="store">Store {$product_store.idLoja}</span><br>
                                            <span class="title">Sell-IT {$product_store.localidade}</span><br>
                                            {if {$product_store.unidades} > 0}
                                                <span class="action in">In stock</span>
                                            {else}
                                                <span class="action out">Out of stock</span>
                                            {/if}
                                        </div>
                                    </div>
                                    {/foreach}
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="section" style="padding-bottom:20px;padding-top:20px">
                <h6 class="title-attr"><small>Quantity</small></h6>
                <div>
                    <div class="btn-minus"><i class="fa fa-minus" aria-hidden="true"></i></div>
                    <input value="1" />
                    <div class="btn-plus"><i class="fa fa-plus" aria-hidden="true"></i></div>
                </div>
            </div>

            <div class="section product-details" style="padding-bottom:20px;">
                <button class="btn btn-success addToCart" {if $existStock == 0}disabled{/if}><i class="fa fa-shopping-cart shopping-symbol" aria-hidden="true"></i>Add to cart</button>
                {if $username}
                    {if $favorite}
                        <h6 class="favorites"><a href="{$BASE_URL}actions/product/remove_wishlist.php?id={$product['idproduto']}"><i class="fa fa-heart-o heart-symbol" aria-hidden="true"></i>Remove from wishlist</a></h6>
                    {else}
                        <h6 class="favorites"><a href="{$BASE_URL}actions/product/add_wishlist.php?id={$product['idproduto']}"><i class="fa fa-heart heart-symbol" aria-hidden="true"></i>Add to wishlist</a></h6>
                    {/if}
                {/if}
            </div>
        </div>
    </div>

    <div class="row prodMoreInfo">
        <div class="col-md-12">
            <ul class="nav nav-tabs flex-column flex-md-row" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#Description" role="tab">Description</a>
                </li>
                {if $isPC == true}
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#Requirements" role="tab">Requirements</a>
                </li>
                {/if}
            </ul>

            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="Description">
                    <div class="product-description">
                        {$product['descricao']}
                    </div>
                    {if $product['video'] != null}
                    <div class="product-video">
                        <iframe width="560" height="315" src="{$product['video']}" frameborder="0" allowfullscreen></iframe>
                    </div>
                    {/if}
                </div>
                <div role="tabpanel" class="tab-pane fade" id="Requirements">
                   {$product['requisitos']}
               </div>
            </div>
        </div>
    </div>

    {if count($relatedProducts) > 0}
    <div class="row" id="products_header">
        <div class="header_best_products col-md-3 col-sm-6">
            <h2>Related</h2>
        </div>
    </div>

    <div class="container-fluid" id="best_products">
        <div>
            <div class="row w-100 " role="listbox">
                {foreach $relNum as $key => $index}
                    <div class="col-md-3 related_product">
                        <div class="card h-70">
                            <a href="{$BASE_URL}pages/products/product.php?id={$relatedProducts[$index]['idproduto']}"><img
                                        class="card-img-top" src="{$BASE_URL}{$relatedProducts[$index]['imagem']}" alt=""></a>
                            <div class="card-body best_products_card_body">
                                <h5 class="card-title">
                                    <a href="{$BASE_URL}pages/products/product.php?id={$relatedProducts[$index]['idproduto']}"
                                       class="best_product_name">{$relatedProducts[$index]['nome']}</a>
                                </h5>
                                {for $count=1 to 5}
                                    {if $count <= {$relatedProducts[$index]['pontuacao']}}
                                        <span class="fa fa-star checked"></span>
                                    {else}
                                        <span class="fa fa-star"></span>
                                    {/if}
                                {/for}
                                <h5 class="best_product_price">{$relatedProducts[$index]['preco']} €</h5>
                            </div>
                            <div class="card-footer">
                                <button name="{$relatedProducts[$index]['idproduto']}" type="button"
                                        class="btn btn-danger btn-lg btn-block add_to_cart"><i
                                            class="fa fa-shopping-cart" aria-hidden="true" > </i> Add to
                                    cart
                                </button>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
    {/if}
</div>
<script>product_id = "{$product['idproduto']}" </script>
{include file='common/footer.tpl'}