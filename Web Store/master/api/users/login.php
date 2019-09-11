<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

function is_ajax() {
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}

function onError(){
    $_SESSION['error_messages'][] = 'Invalid Login!';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

if(is_ajax())
{
    if(isset($_POST['username']) && isset($_POST['password']))
    {
        $identifier = trim($_POST['username']);
        $password_given = trim($_POST['password']);

        try {
            $user = getUser($identifier);
        } catch (PDOException $e) {
            $_SESSION['error_messages'][] = 'Tentativa de login inválido!';
            die($e->getMessage());
        }

        if (!$user) {
            echo json_encode(array("reason" => "User doesn't exist!"));
        } else if (!password_verify($password_given, $user['password'])) {
            echo json_encode(array("reason" => "Incorrect Password!"));
        }
        else {
            $_SESSION['username'] = $user['username'];
            $_SESSION['idutilizador'] = $user['idutilizador'];

            if ($user['admin'])
                $_SESSION['admin'] = $user['idutilizador'];

            $empty = array();
            echo json_encode($empty);
        }
    }
    else
        onError();
}
else
    onError();
?>