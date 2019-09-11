$(document).ready(function() {
    checkoutHandler();
    productQuantityHandler();
    deleteProductHandler();
});

function productQuantityHandler() {

    $(".sc_btn-minus").on("click",function(){
        var input = $(this).next('input');
        var now = input.val();

        var applicable = false;
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--; applicable = true; var product_id = $(this).attr('id');
                var days = 5;
                var qty = -1;
                createCookie(product_id, qty, days);
                refreshCart();}
            input.val(now);
        }else{
            input.val("1");
        }

        if(applicable){
            var unit_price = $(this).closest("div + *").prev().find('span.sc_unit_price').text();
            $(this).closest("div + *").next().find('span.sc_subtotal_price').text((parseFloat(unit_price) * parseInt(now)).toFixed(2) + "€");
            var old_value = parseFloat($(".sc_total_price").text());
            $(".sc_total_price").text((old_value - parseFloat(unit_price)).toFixed(2) + "€");
        }

    });
    $(".sc_btn-plus").on("click",function(){
        var product_id = $(this).attr('id');
        var days = 5;
        var qty = 1;
        createCookie(product_id, qty, days);
        refreshCart();

        var input = $(this).prev('input');
        var now = input.val();

        if ($.isNumeric(now)){
            input.val(parseInt(now)+1);
        }else{
            input.val("1");

        }

        var unit_price = $(this).closest("div + *").prev().find('span.sc_unit_price').text();
        $(this).closest("div + *").next().find('span.sc_subtotal_price').text((parseFloat(unit_price) * (parseInt(now) + 1)).toFixed(2) + "€");
        var old_value = parseFloat($(".sc_total_price").text());
        $(".sc_total_price").text((old_value + parseFloat(unit_price)).toFixed(2) + "€");
    })
}


function checkoutHandler() {

    $(".checkout_btn").on("click",function()
    {
        var data = {
            "Id" : "1",
            "Serie" : 'A',
            "cliente" :
                {
                    "CodCliente" : "manuel",
                    "NomeCliente" : "Manuel da Silva",
                    "NumContribuinte": "229622222",
                    "Morada": "Rua do Manel",
                    "Pais": "PT"
                },
            "LinhasDoc": [
                {
                    "CodArtigo": "G0001",
                    "Quantidade": 1,
                    "Desconto": 0,
                    "PrecoUnitario": 59.99
                }
            ]
        };

        $.ajax({
                url: PRIMAVERA_IP+":44300/api/checkout/",
                type: 'post',
                data: data,
                success: function(data) {
                    location.reload();
                },
                error: function(data)
                {
                    console.log("erro no checkout");
                }
        });
    });
}

function deleteProductHandler()
{
    $(".sc_delete_button").on("click",function()
    {
        var product_id = $(this).attr('name');

        var parent = $(this).parent();
        var grandParent = parent.parent();

        grandParent.remove();
        removeCookie(product_id, 5);

        var cart = JSON.parse(readCookie("checkout"));

        if(Object.keys(cart).length === 0)
        {
            $("<div class=\"row sc_cart_empty_row\">\n" +
                "            Your cart is empty...\n" +
                "        </div>").insertAfter("#sc_grid_header");
        }

        refreshCart();
    });
}