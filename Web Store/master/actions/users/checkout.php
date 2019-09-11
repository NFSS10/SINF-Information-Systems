<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');
    include_once($BASE_DIR . 'database/products.php');

    if(isset($_SESSION['username']))
    {
        $utilizador = $_SESSION['username'];

        try
        {
            $client = checkIfUsernameExists($utilizador);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        $products = json_decode($_COOKIE['checkout'], true);

        if(count($products) == 0)
        {
            $_SESSION['error_messages'][] = "You can not make a order with no products.";
            header('Location: ' . $_SERVER['HTTP_REFERER']);
            die;
        }
        else
        {
            if (isset($_COOKIE['checkout'])) {
                unset($_COOKIE['checkout']);
                setcookie('checkout', '', time() - 3600, '/');
            }

            $productsToSend = array();

            foreach ($products as $id => $qt)
            {
                try
                {
                    $product_db = getProductInfoById($id);
                }
                catch (PDOException $e)
                {
                    die($e->getMessage());
                }

                $product = array (
                    'CodArtigo' => $id,
                    'Quantidade' => $qt,
                    'Desconto' => $product_db['desconto'],
                    'PrecoUnitario' => $product_db['preco']
                );

                array_push($productsToSend, $product);
            }

            $data = array(
                'Serie' => 'A',
                'cliente' => array (
                    'CodCliente' => $client[0]['username'],
                    'NomeCliente' => $client[0]['nome'],
                    'NumContribuinte'=> $client[0]['nif'],
                    'Morada'=> $client[0]['morada'],
                    'Localidade'=> $client[0]['localidade'],
                    'Cpostal'=> $client[0]['cpostal']
                ),
                'LinhasDoc' => $productsToSend
            );

            $url = $PRIMAVERA_IP . ":44300/api/checkout/";

            $postdata = http_build_query($data);

            $opts = array(
                'http' => array(
                    'method'  => 'POST',
                    'header'  => 'Content-type: application/x-www-form-urlencoded',
                    'content' => $postdata,
                ),
                'ssl' => array(
                    'allow_self_signed'=> true,
                    'verify_peer'      => false,
                    'verify_peer_name' => false
                )
            );

            $context = stream_context_create($opts);

            $result = file_get_contents($url, false, $context);

            $_SESSION['success_messages'][] = "You have successfully placed an order.";
            header('Location: ' . $_SERVER['HTTP_REFERER']);
        }
    }
    else
    {
        $_SESSION['error_messages'][] = "You need to login first to place a order.";
        header("Location:	$BASE_URL");
        die;
    }