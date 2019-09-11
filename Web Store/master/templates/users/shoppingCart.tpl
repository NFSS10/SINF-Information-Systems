{include file='common/header.tpl' title={"Shopping Cart"}}

<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/shoppingCart.css">
<script src="{$BASE_URL}javascript/checkout.js"></script>

<div class="container" id="sc_container">
    <div class="sc_back">
        <i class="fa fa-caret-left" aria-hidden="true"></i> <a href="{$BASE_URL}" id="shop_continue">Continue to Shopping </a>
    </div>
    <div class="col-xs-12 col-sm-6 col-md-12 sc" id="sc_grid">
        <div class="row" id="sc_grid_header">
            <div class="col-xs-9 col-sm-9 col-md-9">
                <h4><i class="fa fa-shopping-cart" aria-hidden="true"> Shopping Cart </i></h4>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3">
                <div id="sc_checkout_form_top">
                    <a href="{$BASE_URL}actions/users/checkout.php">
                        <button class="btn btn-block" id="sc_checkout_btn">
                            <i class="fa fa-unlock-alt" aria-hidden="true"></i> Proceed to checkout
                        </button>
                    </a>
                </div>
            </div>
        </div>
        {if count($products) == 0}
            <div class="row sc_cart_empty_row">
                Your cart is empty...
            </div>
        {/if}
        {foreach $products as $key => $product}
            <div class="row sc_row">
                <div class="col-xs-12 col-sm-12 col-md-1">
                    <div class="sc_image">
                        <img class="img-thumbnail" src="{$BASE_URL}{$product['imagem']}" alt="{$product['imagem']}"/>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-5">
                    <a href="#" class="sc_product_title"><h5> {$product['nome']}</h5></a>
                    <span><strong>Plataform: </strong> {$product['categoria']}</span><br>
                    <span><strong>Unit. Price: </strong> <span class="sc_unit_price"> {round($product['preco'] * ((100 - $product['desconto'])/100), 2)} €</span></span>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-3">
                    <div class="section sc_item_quantity">
                        <div>
                            <div id="{$product['idproduto']}" class="sc_btn-minus"><i class="fa fa-minus" aria-hidden="true"></i></div>
                            <input value="{$product['qt']}" readonly/>
                            <div id="{$product['idproduto']}" class="sc_btn-plus"><i class="fa fa-plus" aria-hidden="true"></i></div>
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-2">
                    <h6 class="sc_subtotal_price"><strong> Sub-Total: </strong><span class="sc_subtotal_price">{round($product['preco'] * ((100 - $product['desconto'])/100), 2) * $product['qt']} €</span>
                    </h6>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-1">
                    <button name="{$product['idproduto']}" type="button" class="btn btn-danger btn-block sc_delete_button">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                    </button>
                </div>

            </div>
        {/foreach}

        <div class="row sc_total sc_total_chec_group">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div>
                    <span> Total: </span> <span class="sc_total_price">{$totalPrice} €</span>
                </div>
            </div>
        </div>

        <div class="row sc_total_chec_group">
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div id="sc_checkout_form_bot">
                    <a href="{$BASE_URL}actions/users/checkout.php">
                        <button class="btn btn-block" id="sc_checkout_btn">
                            <i class="fa fa-unlock-alt" aria-hidden="true"></i> Proceed to checkout
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


{include file='common/footer.tpl'}