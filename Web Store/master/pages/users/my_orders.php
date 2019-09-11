<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/users.php');

    if(isset($_SESSION['username']))
    {

        $utilizador = $_SESSION['username'];
        $url = $PRIMAVERA_IP.":44300/api/encomendas/".$utilizador;
        $contextOptions = array(
            'ssl' => array(
                'allow_self_signed'=> true,
                'verify_peer'      => false,
                'verify_peer_name' => false,
            )
        );
        $sslContext = stream_context_create($contextOptions);
        $resp = @file_get_contents($url, false, $sslContext);
        $orders = json_decode($resp, true);

        for($i = 0; $i < count($orders); $i++)
        {

            list($firstWord) = explode('T', $orders[$i]['Data']);
            $orders[$i]['Data'] = $firstWord . " " . $orders[$i]['Horas'];

            $orders[$i]['OrderNumber'] = '#' . $orders[$i]['Serie'] . $orders[$i]['NumDoc'];

            switch ($orders[$i]['Estado']['tipoDoc']) {
                case "ECL":
                    $orders[$i]['Informacao'] = "To be processed";
                    $orders[$i]['Cor'] = "tbp";
                    break;
                case "GR":
                    $orders[$i]['Informacao'] = "Delivering";
                    $orders[$i]['Cor'] = "ip";
                    break;
                case "FA":
                    $orders[$i]['Informacao'] = "Invoice Issued";
                    $orders[$i]['Cor'] = "ip";
                    break;
                case "FR":
                    $orders[$i]['Informacao'] = "Payment done";
                    $orders[$i]['Cor'] = "rtpu";
                    break;
                default:
                    $orders[$i]['Informacao'] = "Unknown state";
                    $orders[$i]['Cor'] = "";
            }
        }

        $smarty->assign('orders', $orders);
        $smarty->display('users/my_orders.tpl');
    }
    else
    {
        $smarty->display('common/notFound.tpl');
    }



?>
