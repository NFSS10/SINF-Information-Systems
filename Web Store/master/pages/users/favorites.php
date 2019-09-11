<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');
    include_once($BASE_DIR . 'database/products.php');

    if(isset($_SESSION['username']))
    {
        try
        {
            $username = $_SESSION['username'];

            $user = checkIfUsernameExists($username)[0]['idutilizador'];

            $favorites = getFavorites($user);
        }
        catch (PDOException $e)
        {
            die($e->getMessage());
        }

        $smarty->assign('favorites', $favorites);
        $smarty->display('users/favorites.tpl');
    }
    else
    {
        $smarty->display('common/notFound.tpl');
    }