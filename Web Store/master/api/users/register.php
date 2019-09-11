<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

//Function to check if the request is an AJAX request
function is_ajax() {
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}

function onError()
{
    $_SESSION['error_messages'][] = 'Invalid registration attempt!';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

if (is_ajax()) {
    if (isset($_POST["username"]) && isset($_POST["password"]) && isset($_POST["email"])
        && isset($_POST["name"]) && isset($_POST["nif"]) && isset($_POST["address"])
        && isset($_POST["pcode"]) && isset($_POST["birthday"]) && isset($_POST["regdate"])
        && isset($_POST["town"])) {

        $username = trim($_POST['username']);
        $password = trim($_POST['password']);
        $email = trim($_POST['email']);
        $name = trim($_POST['name']);
        $nif = trim($_POST['nif']);
        $address = trim($_POST['address']);
        $town = trim($_POST['town']);
        $pcode = trim($_POST['pcode']);
        $bday = trim($_POST['birthday']);
        $regday = trim($_POST['regdate']);

        try {
            $countUsername = checkIfUsernameExists($username);
            $countEmail = checkIfEmailExists($email);
        } catch (PDOException $e) {
            $_SESSION['error_messages'][] = 'Error caught when accessing database';
            die($e->getMessage());
        }


        if ($countUsername) {
            echo json_encode(array("reason" => "Username already exists!"));
        } else if ($countEmail) {
            echo json_encode(array("reason" => "Email already in use. Try another!"));
        } else {
            try {
                newUser($username, password_hash($password, PASSWORD_BCRYPT), $email, $name, $nif, $address, $town, $pcode, $bday, $regday);
                $empty = array();
                echo json_encode($empty);
            } catch (PDOException $e) {
                echo json_encode(array("reason" => "Error found when inserting user in db"));
            }
        }
    }
    else
        onError();
}
else
    onError();
?>