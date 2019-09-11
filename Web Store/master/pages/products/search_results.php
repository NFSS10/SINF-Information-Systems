<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/products.php');

    $products_per_page = 5;

    include_once($BASE_DIR . 'pages/templates/pagination/handlePageID.php');

    if($page_index < 1)
    {
        $_SESSION['error_messages'][] = "You tried to access a non-existent page!";
        header("Location:	$BASE_URL");
        die;
    }

    if(isset($_GET['query']) && $_GET['query'] != "")
    {
        $query = trim($_GET['query']);

        try
        {
            $products = getProductsSearch($query);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        $numberOfResults = count($products);

        $ratings = array();
        for($i = 0; $i < $numberOfResults; $i++)
        {
            $product_review = intval(getAverageRating($products[$i]['idproduto'])['pontuacao']);
            array_push($ratings, $product_review);
        }

        $pageNo = ceil(min($numberOfResults/$products_per_page, 60/$products_per_page));
        $offset = ($page_index - 1)  * $products_per_page;

        $products = array_slice($products, $offset, $products_per_page);

        $smarty->assign('products_review', $ratings);
        $smarty->assign('numberOfResults', $numberOfResults);
        $smarty->assign('query', $query);
        $smarty->assign('products', $products);

        $smarty->assign('pageNo', $pageNo);
        $smarty->assign('atualPage', $page_index);
    }
    else
    {
        if(isset($_GET['platform']) && $_GET['platform'] != "")
        {
            $platform = trim($_GET['platform']);

            try
            {
                $products = getProductsSearchPlatform($platform);
                $description_platform = getDescriptionPlatform($platform);
            }
            catch (PDOException $e)
            {
                die($e->getMessage());
            }

            $numberOfResults = count($products);

            $ratings = array();
            for($i = 0; $i < $numberOfResults; $i++)
            {
                $product_review = intval(getAverageRating($products[$i]['idproduto'])['pontuacao']);
                array_push($ratings, $product_review);
            }

            $pageNo = ceil(min($numberOfResults/$products_per_page, 60/$products_per_page));
            $offset = ($page_index - 1)  * $products_per_page;

            $products = array_slice($products, $offset, $products_per_page);

            $smarty->assign('products_review', $ratings);
            $smarty->assign('numberOfResults', $numberOfResults);
            $smarty->assign('platform', $platform);
            $smarty->assign('platformName', $description_platform['nome']);
            $smarty->assign('products', $products);

            $smarty->assign('pageNo', $pageNo);
            $smarty->assign('atualPage', $page_index);
        }
        else
            $smarty->assign('numberOfResults', 0);
    }

    $smarty->display('products/search_results.tpl');
?>
