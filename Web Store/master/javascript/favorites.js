$(document).ready(function() {
    handlerDeleteFavorite();
    handlerTable();
});

function handlerDeleteFavorite() {

    $("button.delete-button").click(function() {
        var parent = $(this).parent();
        var grandParent = $(parent).parent();
        var product_id = parent.attr('class');

        $.post(BASE_URL + "api/users/delete_favorite.php", {
            product_id: product_id
        }, function (data) {
            if(data.length == 0)
                grandParent.remove();
        }, "json");

    });
}

function handlerTable()
{
    $('.favorites-table').DataTable({
        "order": [[ 0, "desc" ]]
    });
}