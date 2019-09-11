$(document).ready(function() {
    handlerTable();
    handlerReview();
    handlerMouseOver();
});

function handlerTable()
{
    $('.order-status-table').DataTable({
        "order": [[ 0, "desc" ]]
    });
}

function handlerReview()
{
    $(".ratings").click(function() {
        var value = $(this).attr('id');
        var id = $(this).parent().attr('id');

        if($(this).parent().hasClass("reviewed") === false)
        {
            // Update colors of stars
            $(this).nextAll().addClass("checked");
            $(this).addClass("checked");
            $(this).parent().addClass("reviewed");

            // Update database
            $.post(BASE_URL + "api/users/insert_review.php", {
                pontuacao: value,
                idproduto: id,
                idordem: order_id
            }, function (data) {
            }, "json");
        }
    });
}

function handlerMouseOver()
{
    $(".ratings").hover(
        function() {
            if($(this).parent().hasClass("reviewed") === false)
            {
                // Update colors of stars
                $(this).nextAll().addClass("checked");
                $(this).addClass("checked");
            }
        },
        function() {
            if($(this).parent().hasClass("reviewed") === false)
            {
                // Update colors of stars
                $(this).nextAll().removeClass("checked");
                $(this).removeClass("checked");
            }
        });
}