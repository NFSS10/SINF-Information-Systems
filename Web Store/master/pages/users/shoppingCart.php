<?php
    include_once('../../config/init.php');

    include_once($BASE_DIR . 'database/products.php');

    $cart = json_decode($_COOKIE['checkout'], true);

    if(count($cart) == 0)
    {
        $total = 0;
    }
    else
    {
        // Add all products to ask for info on database
        $all_products = "";
        foreach ($cart as $key => $value)
        {
            $all_products .= 'idproduto = \''.$key . '\' OR ';
        }

        // Remove last OR

        $all_products = substr($all_products, 0, -4);

        try
        {
            $products = getCheckoutProductsCheckoutPage($all_products);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        $total = 0;

        for ($i = 0; $i < count($products); $i++)
        {
            foreach ($cart as $key => $value)
            {
                if($products[$i]['idproduto'] == $key)
                {
                    $total += ($products[$i]['preco'] * ((100 - $products[$i]['desconto'])/100)) * $value;
                    $products[$i]['qt'] = $value;
                    break;
                }

            }
        }
        $smarty->assign('products', $products);

    }

    $smarty->assign('totalPrice', round($total,2));

    $smarty->display('users/shoppingCart.tpl');
?>
