<?php

    session_start();
    session_set_cookie_params(3600, '/usr/users2/mieic2012/up201207133/public_html/');
    error_reporting(E_ALL & ~E_NOTICE);

    $BASE_DIR = '/usr/users2/mieic2012/up201207133/public_html/sinf/';
    $BASE_URL = 'https://gnomo.fe.up.pt/~up201207133/sinf/';
    $PRIMAVERA_IP = 'https://77.54.89.208';

    $conn = new PDO('pgsql:host=db.fe.up.pt;dbname=postgres', 'up201207133', 'MGMg5JEw5');
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    include_once($BASE_DIR . 'lib/smarty/Smarty.class.php');

    $smarty = new Smarty;
    $smarty->template_dir = $BASE_DIR . 'templates/';
    $smarty->compile_dir = $BASE_DIR . 'templates_c/';

    $smarty->assign('BASE_URL', $BASE_URL);
    $smarty->assign('PRIMAVERA_IP', $PRIMAVERA_IP);

    $smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);
    $smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
    $smarty->assign('USERNAME', $_SESSION['username']);
    $smarty->assign('ADMIN', $_SESSION['admin']);

    unset($_SESSION['success_messages']);
    unset($_SESSION['error_messages']);

?>