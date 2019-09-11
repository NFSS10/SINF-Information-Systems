<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

function is_ajax() {
    return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}

if(is_ajax())
{
    if (isset($_POST["name"]) && isset($_POST["pcode"]) && isset($_POST["birthday"]) && isset($_POST["town"])) {

        $name = trim($_POST['name']);
        $bday = trim($_POST['birthday']);

        $address = trim($_POST['address']);
        $town = trim($_POST['town']);
        $pcode = trim($_POST['pcode']);

        $username = $_SESSION['username'];

        try {
            editUserInfo($username, $name, $bday, $address, $town, $pcode);
            $nif = getUserInfoByUsername($username)['nif'];
        } catch (PDOException $e) {
            $_SESSION['error_messages'][] = 'Tentativa de login inválido!';
            die($e->getMessage());
        }

        $data = array(
            'CodCliente' => $username,
            'NomeCliente' => $name,
            'NumContribuinte'=> $nif,
            'Morada' => $address,
            'Localidade' => $town,
            'Cpostal' => $pcode
        );

        $url = $PRIMAVERA_IP . ":44300/api/clientes/". $username;

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

        $empty = array();
        echo json_encode($empty);
    }

}



