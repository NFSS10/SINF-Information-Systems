<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/products.php');
    include_once($BASE_DIR . 'database/users.php');


    if (!isset($_GET['id']))
    {
        $smarty->display('common/notFound.tpl');
    }
    else
    {
        $product_id = trim($_GET['id']);

        if(isset($_SESSION['username']))
        {
            $username = $_SESSION['username'];

            if(isFavorite($username, $product_id))
                $smarty->assign('favorite', true);
        }

        $product = array();
        $product_stores = array();

        try
        {
            $product = getProductInfoById($product_id);

            $existStock = false;
            for($i = 0; $i < count($data['StockExistente']); $i++)
            {
                if($data['StockExistente'][$i]['unidades'] > 0)
                {
                    $existStock = true;
                    break;
                }
            }
            //////////////////////////////////////////////////////////////////

            $product_stores = getQuantityStoresByProduct($product_id);
            $existStock = false;
            for($i = 0; $i < count($product_stores); $i++)
            {
                if($product_stores[$i]['unidades'] > 0)
                {
                    $existStock = true;
                    break;
                }
            }

            $product_review = intval(getAverageRating($product_id)['pontuacao']);

            $related_products = getRelatedProducts($product['nome'], $product['idcategoria'], $product['genero']);

            $max = min(count($related_products), 4);  // 1

            if(count($related_products) > 0)
                $rand_keys = array_rand($related_products, $max);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        if(!$product)
        {
            $smarty->display('common/notFound.tpl');
        }
        else
        {
            $smarty->assign('product', $product);
            $smarty->assign('productStores', $product_stores);
            $smarty->assign('existStock', $existStock);
            $smarty->assign('review', $product_review);
            $smarty->assign('username', $username);
            $smarty->assign('relNum', $rand_keys);
            $smarty->assign('relatedProducts', $related_products);

            if($product['idcategoria'] == 'PC')
                $smarty->assign('isPC', true);

            $smarty->display('products/product.tpl');
        }
    }
?>
