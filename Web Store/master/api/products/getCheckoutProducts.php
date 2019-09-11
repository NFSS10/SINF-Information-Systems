<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/products.php');

//Function to check if the request is an AJAX request
function is_ajax()
{
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}


if (is_ajax()) {

    if (isset($_POST['query'])) {
        $string = trim($_POST['query']);
        try {
            $checkout_products = getCheckoutProducts($string);
        } catch (PDOException $e) {
            $_SESSION['error_messages'][] = 'Error found when trying to obtain catalogue products from database!';
            die($e->getMessage());
        }

    echo json_encode($checkout_products);
    }
}

