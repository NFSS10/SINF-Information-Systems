$(document).ready(function () {
    handlerAddToCart();
});


function handlerAddToCart() {
    $("button.sr_add_to_cart").click(function () {
        var product_id = $(this).attr('name');
        var days = 5;
        var qty = 1;


        var imgtodrag = $(this).parent().parent().find("img").eq(0);

        var productImage = $(imgtodrag);

        var cart = $('#my_cart_button');

        var productImageClone = $(productImage).clone();
        productImageClone.removeAttr('class');
        $(productImageClone).css({position: 'absolute', top: $(this).offset().top + "px", left: $(this).offset().left  + "px", opacity: 1, 'z-index': 9999, width : 50 + "px", height: 50 + "px"});
        $('body').append($(productImageClone));
        var gotoX = $(cart).offset().left + ($(cart).width() / 2);
        var gotoY = $(cart).offset().top + ($(cart).height() / 2) - 50/2;

        $(productImageClone).animate({
                opacity: 0.4,
                left: gotoX,
                top: gotoY,
                width: 50 + "px",
                height: 50 + "px"
            }, 700,
            function () {
                $(cart).fadeOut('fast', function () {
                    $(cart).fadeIn('fast', function () {

                        $(productImageClone).remove();

                    });
                });
            });

        createCookie(product_id, qty, days);
        refreshCart();
    });
}
