$(document).ready(function() {
    initMessageClosers();
    refreshCart();

        $(window).resize(function() {
            //console.debug($("#bc1 a:hidden"))
            ellipses1 = $("#bc1 :nth-child(2)")
            if ($("#bc1 a:hidden").length >0) {ellipses1.show()} else {ellipses1.hide()}

            ellipses2 = $("#bc2 :nth-child(2)")
            if ($("#bc2 a:hidden").length >0) {ellipses2.show()} else {ellipses2.hide()}
        })

});

function initMessageClosers() {
  $('.closeError').click(function() {
    $(this).parent().fadeOut();
  });
}


function createCookie(id, qty, days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    var cookie = readCookie("checkout");

    if(cookie !== null)
    {
        var products = JSON.parse(cookie);
        if(products[id])
            products[id] = products[id] + qty;
        else
            products[id] = qty;
        document.cookie = "checkout" + "=" + JSON.stringify(products) + expires + "; path=/";
    }
    else
    {
        var products1 = {};
        products1[id] = qty;
        document.cookie = "checkout" + "=" + JSON.stringify(products1) + expires + "; path=/";
    }
}

function removeCookie(id, days)
{
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }

    var cookie = readCookie("checkout");

    if(cookie !== null)
    {
        var products = JSON.parse(cookie);
        var new_products = {};

        for (var i in products)
        {
            if (products.hasOwnProperty(i)) {
                if(i !== id)
                {
                    new_products[i] = products[i];
                }
            }
        }

        document.cookie = "checkout" + "=" + JSON.stringify(new_products) + expires + "; path=/";
    }
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function refreshCart()
{
    var cart = JSON.parse(readCookie("checkout"));

    var product_quantity = [];
    var queryString = "";
    var counter = 0;
    if(cart !== null && Object.keys(cart).length !== 0)
    {
        var psize = Object.keys(cart).length;
        for (var k in cart) {
            if (cart.hasOwnProperty(k)) {
                product_quantity[k] = cart[k];
                if(counter == (psize - 1))
                    queryString += 'idproduto = ' +  "'" + k + "'";
                else
                    queryString += 'idproduto = ' + "'" + k + "'" + ' OR ';
            }
            counter++;
        }

        $.post(BASE_URL + "api/products/getCheckoutProducts.php", {
            query: queryString
        }, function (data) {
            if (data.length != 0) {

                var total = 0.00;
                $('.shopping-cart-item').remove();
                for (var i = 0; i < data.length; i++)
                {
                    var qt = product_quantity[data[i]['idproduto']];
                    var preco = parseFloat(data[i]['preco'] * (1- (parseInt(data[i]['desconto'])/100))).toFixed(2);
                    total = total + parseFloat(preco) * qt;
                    var img = data[i]['imagem'];
                    var nome = data[i]['nome'];


                    var element =
                        "<div class='row shopping-cart-item'>" +
                        "<div class='col-xs-4 col-md-4 sc_item_img'>" +
                        "<img src=" + BASE_URL + img + " />" +
                        "</div>" +
                        "<div class='col-sm-5 col-md-5 cart_product_name' >" +
                        "<span class='item-name'>" + nome + "</span>" +
                        "</div>" +
                        "<div class='col-sm-3 col-md-3'>" +
                        "<span class='item-price'>" + preco + "€ </span> <br>" +
                        "<span class='item-qt'>Qt: " + qt + "</span>" +
                        "</div>" +
                        "</div> ";

                    $(element).insertBefore('.checkout_btn');
                }

                total = parseFloat(total).toFixed(2);
                $('.main-color-text').text(total + "€");
                $('.my_cart_total').text(total);
                $('.lighter-text').text("Total:");
                $('#shopping_cart_dropdown .checkout_btn').show();
                $('.shopping-cart-header').show();
                $('.no_products_container').hide();
            }

        }, "json");
    }
    else
    {
        $('.shopping-cart-item').hide();
        $('.my_cart_total').text('0.00');
        $('#shopping_cart_dropdown .checkout_btn').hide();
        $('.shopping-cart-header').hide();
        $('.no_products_container').show();

    }
}
