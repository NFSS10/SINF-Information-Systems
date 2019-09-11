$(document).ready(function() {

    $("#my_cart_button").click(function(e){
        e.stopPropagation();
        $(".shopping-cart").toggle( "fast");
    });

    $(document).click(function(){
        $(".shopping-cart").hide("fast");
    });
});