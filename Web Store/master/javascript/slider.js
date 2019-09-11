$(document).ready(function() {
    carrouselHandler();
    handlerAddToCartCatalogue();
    addToCartAnimation();
});

function carrouselHandler()
{
    $('#showcase #best_products_carrousel .carousel-inner .carousel-item').eq(0).addClass("active");
    $('#showcase #sales_carousel .carousel-inner .carousel-item').eq(0).addClass("active");

    $('#showcase .carousel-inner .carousel-item .sales_price_badge').css("bottom",  $('#showcase .carousel-inner .sales_card_body').height() + $('#showcase .carousel-inner .carousel-item .sales_price_badge').height() + $('#showcase .carousel-inner .carousel-item .card-footer').height() + 49 );

    $('.carousel').on('slide.bs.carousel', function (e) {

        var $e = $(e.relatedTarget);
        var idx = $e.index();
        var itemsPerSlide = 4;
        var totalItems = $(this).find('.carousel-item').length;

        if (idx >= totalItems-(itemsPerSlide-1)) {
            var it = itemsPerSlide - (totalItems - idx);
            for (var i=0; i<it; i++) {
                // append slides to end
                if (e.direction=="left") {
                    $(this).find('.carousel-item').eq(i).appendTo($(this).find('.carousel-inner'));
                }
                else {
                    $(this).find('.carousel-item').eq(0).appendTo($(this).find('.carousel-inner'));
                }
            }
        }
    });
    $('#sales_next').click(function(){ $('#sales_carousel').carousel('next');return false; });
    $('#sales_prev').click(function(){ $('#sales_carousel').carousel('prev');return false; });

    $('#bestp_next').click(function(){ $('#best_products_carrousel').carousel('next');return false; });
    $('#bestp_prev').click(function(){ $('#best_products_carrousel').carousel('prev');return false; });
}


function handlerAddToCartCatalogue()
{
    $("button.add_to_cart").click(function() {
        var product_id = $(this).attr('name');
        var days = 5;
        var qty = 1;

        createCookie(product_id, qty, days);
        refreshCart();
    });
}

function addToCartAnimation()
{
    $('.add_to_cart').on('click', function () {

        var imgtodrag = $(this).parent().parent('.card').find("img").eq(0);

        var productImage = $(imgtodrag);
        var cart = $('#my_cart_button');

        var productImageClone = $(productImage).clone();
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

    });
}
