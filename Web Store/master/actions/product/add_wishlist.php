<?php
    include_once ('../../config/init.php');

    include_once ($BASE_DIR . 'database/products.php');
    include_once ($BASE_DIR . 'database/users.php');

    if(!isset($_SESSION['username']))
    {
        $_SESSION['error_messages'][] = "Não tens permissão para aceder à página pretendida!";
        header("Location:	$BASE_URL");
        die;
    }
    else {
        if (!isset($_GET['id'])) {
            $_SESSION['error_messages'][] = "Id do produto que pretende adicionar aos seus favoritos não foi especificado!";
            header('Location: ' . $_SERVER['HTTP_REFERER']);
            die;
        }

        $product_id = $_GET['id'];
        $username = $_SESSION['username'];

        try {
            $user_id = getUser($username)['idutilizador'];

            if(isFavorite($username, $product_id))
            {
                $_SESSION['error_messages'][] = "Produto que pretende adicionar aos seus favoritos já se encontra na lista.";
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                die;
            }
            else
            {
                addWishedProduct($user_id, $product_id);
            }

        } catch (PDOException $e) {
            die($e->getMessage());
        }

    }
    $_SESSION['success_messages'][] = "Produto adicionado com sucesso aos seus favoritos!";
    header('Location: ' . $_SERVER['HTTP_REFERER']);