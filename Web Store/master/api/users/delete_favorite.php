<?php
    include_once('../../config/init.php');
    include_once ($BASE_DIR . 'database/products.php');
    include_once ($BASE_DIR . 'database/users.php');


    if (!$_POST['product_id'] || !$_SESSION['username'])
    {
        $_SESSION['error_messages'][] = 'Cannot delete this product from your favorites!';
        header('Location: ' . $BASE_URL);
        exit;
    }
    else
    {
        $product_id = trim($_POST['product_id']);

        $username = $_SESSION['username'];

        try
        {
            $user_id = checkIfUsernameExists($username)[0]['idutilizador'];
            if(getProductInfoById($product_id))
            {
                if($user_id)
                {
                    removeWishedProduct($user_id, $product_id);
                    echo json_encode(array());
                }
            }
            else
            {
                echo json_encode(array("erro" => "There was a problem removing from database!"));
            }


        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

    }
