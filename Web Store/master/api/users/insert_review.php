<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    //Function to check if the request is an AJAX request
    function is_ajax()
    {
        return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
    }

    if (is_ajax()) {

        if (isset($_SESSION['username']) && isset($_POST['pontuacao']) && isset($_POST['idproduto']) && isset($_POST['idordem']))
        {
            $username = $_SESSION['username'];
            $pontuacao = $_POST['pontuacao'];
            $idProduto = $_POST['idproduto'];
            $idOrdem = $_POST['idordem'];

            try {
                $idutilizador = checkIfUsernameExists($username)[0]['idutilizador'];

            } catch (PDOException $e) {
                $_SESSION['error_messages'][] = 'Error found when trying to obtain information from database!';
                die($e->getMessage());
            }

            try {
                $order_exists = checkIfOrderExists($idOrdem, $idutilizador);

                if(!$order_exists)
                    createOrder($idOrdem, $idutilizador);

                createReviewInAOrder($idOrdem, $pontuacao, $idProduto);
            } catch (PDOException $e) {
                $_SESSION['error_messages'][] = 'You already made a review for this product!';
                die($e->getMessage());
            }

            echo json_encode(array());
        }
        else
        {
            $error = array("reason" => "Missing parameters");
            echo json_encode($error);
        }
    }
