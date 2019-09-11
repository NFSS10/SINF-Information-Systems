$(document).ready(function() {
    quantityHandler();
    resizeVideos();
    handlerAddToCart();
});

function quantityHandler() {
    $(".btn-minus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $(".section > div > input").val(now);
        }else{
            $(".section > div > input").val("1");
        }
    })
    $(".btn-plus").on("click",function(){
        var now = $(".section > div > input").val();
        if ($.isNumeric(now)){
            $(".section > div > input").val(parseInt(now)+1);
        }else{
            $(".section > div > input").val("1");
        }
    })
}

function resizeVideos()
{
    var $allVideos = $("iframe[src^='//www.youtube.com']"),
        $fluidEl = $("body");

    $allVideos.each(function() {
        $(this)
            .data('aspectRatio', this.height / this.width)
            .removeAttr('height')
            .removeAttr('width');
    });

    $(window).resize(function() {
        var newWidth = $fluidEl.width();

        $allVideos.each(function() {
            var $el = $(this);
            $el
                .width(newWidth)
                .height(newWidth * $el.data('aspectRatio'));

        });
    }).resize();
}

function handlerAddToCart()
{
    $(".addToCart").on("click",function() {
        var id = product_id;
        var days = 5;
        var qty = parseInt($(".section > div > input").val());
        createCookie(id, qty, days);
        refreshCart();


        var productImage = $('.product-image');
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
