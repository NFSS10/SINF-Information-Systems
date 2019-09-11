<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/products.php');

    try {
        $topten = getTopTenProducts();
        $discount_products = getBestDiscounts();
        $newest_products = getNewestProducts();

    } catch (PDOException $e) {
        $_SESSION['error_messages'][] = 'Error found when trying to obtain catalogue products from database!';
        die($e->getMessage());
    }

    $smarty->assign('discount_products', $discount_products);
    $smarty->assign('topten', $topten);
    $smarty->assign('newest_products', $newest_products);
    $smarty->display('products/catalogue.tpl');
?>
