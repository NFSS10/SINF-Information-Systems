{include file='common/header.tpl'}

<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/search_results.css">
<script src="{$BASE_URL}javascript/search_results.js"></script>
<script src="{$BASE_URL}javascript/product_details_wrapper.js"></script>

<div class="container" id="sr_container">
    <div class="search_header">
        <br>
        <h1>Search Results</h1>
        <h4 class="search_info"><strong>{$numberOfResults}</strong> results were found for the search for
                {if $query != null}
                    <strong> {$query}</strong>
                {else}
                    platform <strong>{$platformName}</strong>
                {/if}

        </h4>
    </div>

    <section class="col-xs-12 col-sm-6 col-md-12">
        {foreach $products as $key => $product}
        <article class="row">
            <div class="col-xs-12 col-sm-12 col-md-2">
                <a href="{$BASE_URL}pages/products/product.php?id={$product['idproduto']}" title="{$product['nome']}" class="search_thumbnail"><img class="img-thumbnail" src="{$BASE_URL}{$product['imagem']}" alt="{$product['nome']}" /></a>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-2">
                <a href="{$BASE_URL}pages/products/product.php?id={$product['idproduto']}"><h4> {$product['nome']}</h4></a>
                {for $count=1 to 5}
                    {if $count <= {$products_review[$key]}}
                        <span class="fa fa-star checked"></span>
                    {else}
                        <span class="fa fa-star"></span>
                    {/if}
                {/for}
                <div class="sr_product_details">
                    <h6> <strong>Plataform:</strong> {$product['categoria']}</h6>
                    <h6> <strong>Price:</strong> {round($product['preco'] * ((100 - $product['desconto'])/100), 2)} €</h6>
                    <h6><strong>Release Date: </strong><br>{$product['datalancamento']}</h6>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-4 sr_product_description" >
                <h6> <strong>Description:</strong></h6>
                <p class="minimize">{$product['descricao']}</p>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-2">
                {if {$product['stkatual']} != 0}
                <h6 class="text-success"> <i class="fa fa-check" aria-hidden="true"></i> In stock</h6>
                {else}
                    <h6 class="text-danger"> <i class="fa fa-times" aria-hidden="true"></i> Out of stock</h6>
                {/if}
            </div>

            <div class="col-xs-12 col-sm-12 col-md-2">
                <button name="{$product['idproduto']}" type="button" class="btn btn-danger btn-block btn-lg sr_add_to_cart" {if $product['stkatual'] == 0}disabled{/if}> <i class="fa fa-shopping-cart" aria-hidden="true"> </i> Add to cart </button>
            </div>
        </article>
        {/foreach}
    {if {$numberOfResults} != 0}
    <nav aria-label="pagination" id="pagination">
        <ul class="pagination justify-content-center">
            {if $query != null}
                {if {$atualPage} > 1 }
                    <li class="page-item">
                        <a class="page-link" href="{$BASE_URL}pages/products/search_results.php?query={$query}&page={$atualPage - 1}" tabindex="-1">Previous</a>
                    </li>
                {/if}
                {for $key=1 to $pageNo}
                    {if $key == $atualPage}
                        <li class="page-item active"><a class="page-link" href="#">{$key}</a></li>
                    {else}
                        <li class="page-item"><a class="page-link" href="{$BASE_URL}pages/products/search_results.php?query={$query}&page={$key}">{$key}</a></li>
                    {/if}
                {/for}
                {if $atualPage < $pageNo }
                    <li class="page-item">
                        <a class="page-link" href="{$BASE_URL}pages/products/search_results.php?query={$query}&page={$atualPage + 1}">Next</a>
                    </li>
                {/if}
            {else}
                {if {$atualPage} > 1 }
                    <li class="page-item">
                        <a class="page-link" href="{$BASE_URL}pages/products/search_results.php?platform={$platform}&page={$atualPage - 1}" tabindex="-1">Previous</a>
                    </li>
                {/if}
                {for $key=1 to $pageNo}
                    {if $key == $atualPage}
                        <li class="page-item active"><a class="page-link" href="#">{$key}</a></li>
                    {else}
                        <li class="page-item"><a class="page-link" href="{$BASE_URL}pages/products/search_results.php?platform={$platform}&page={$key}">{$key}</a></li>
                    {/if}
                {/for}
                {if $atualPage < $pageNo }
                    <li class="page-item">
                        <a class="page-link" href="{$BASE_URL}pages/products/search_results.php?platform={$platform}&page={$atualPage + 1}">Next</a>
                    </li>
                {/if}
            {/if}
        </ul>
    </nav>
    {else}
        <div class="no_results" style="margin-bottom: 200px"></div>
    {/if}
</div>

{include file='common/footer.tpl'}