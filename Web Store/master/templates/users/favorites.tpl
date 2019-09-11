{include file='common/header.tpl' title={"Favorite Products"}}

<link rel="stylesheet" type="text/css" href="{$BASE_URL}css/favorites.css">
<script src="{$BASE_URL}javascript/favorites.js"></script>

<div class="container">
    <div class="breadcrumb_container">
        <ul class="breadcrumb">
            <li><a href="{$BASE_URL}">Home</a></li>
            <li><a href="#">My account</a></li>
            <li class="active">Wish list</li>
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
                    <li><a href="#">Wish list</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 col-sm-8 main-content" id="favorites_content">

            <table class="favorites-table table-responsive">
                <thead>
                <tr>
                    <th><h1>Product Name</h1></th>
                    <th><h1>Actual Price</h1></th>
                    <th><h1>Category</h1></th>
                    <th><h1>Delete</h1></th>
                </tr>
                </thead>
                <tbody>
                {foreach $favorites as $key => $favorite}
                <tr>
                    <td><a href="{$BASE_URL}pages/products/product.php?id={$favorite['idproduto']}">{$favorite['nome']}</td>
                    <td>{round($favorite['preco'] * ((100 - $favorite['desconto'])/100), 2)} €</td>
                    <td>{$favorite['categoria']}</td>
                    <td class="{$favorite['idproduto']}">
                        <button type="button" class="btn btn-danger delete-button"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                    </td>
                </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}