<?php
    include_once('../../config/init.php');
    include_once($BASE_DIR . 'database/products.php');

    if (!isset($_GET['ndoc']) || !isset($_GET['serie']))
    {
        $smarty->display('common/notFound.tpl');
    }
    else
    {
        if (isset($_SESSION['username']))
        {
            $utilizador = $_SESSION['username'];
            $order_number = trim($_GET['ndoc']);
            $order_serie = trim($_GET['serie']);
            $order_id = $order_serie . $order_number;

            if (is_numeric($order_number))
            {
                $url = $PRIMAVERA_IP . ":44300/api/encomendas/" . $utilizador . "/" . $order_serie . "/" . $order_number;

                $contextOptions = array(
                    'ssl' => array(
                        'allow_self_signed' => true,
                        'verify_peer' => false,
                        'verify_peer_name' => false,
                    )
                );
                $sslContext = stream_context_create($contextOptions);
                $resp = @file_get_contents($url, false, $sslContext);
                $order = json_decode($resp, true);

                if($order['artigos'] == null)
                {
                    $smarty->display('common/notFound.tpl');
                }
                else
                {

                    list($firstWord) = explode('T', $order['dataCriacao']);
                    $order['dataCriacao'] = $firstWord . " " . $order['Horas'];

                    try {
                        for ($i = 0; $i < count($order['artigos']); $i++) {
                            $review = alreadyExistsReview($order['artigos'][$i]['codArtigo'], $utilizador, $order_id);
                            if (count($review) != 0) {
                                $order['artigos'][$i]['review'] = round($review[0]['pontuacao'], 2, PHP_ROUND_HALF_UP);
                            } else {
                                $order['artigos'][$i]['review'] = "semReview";
                            }
                        }
                    } catch (PDOException $e) {
                        die($e->getMessage());
                    }


                    for ($i = 0; $i < count($order['estados']); $i++) {
                        $data = substr($order['estados'][$i]['data'], 0, -9);
                        $order['estados'][$i]['data'] = $data . " " . $order['estados'][$i]['Horas'];

                        $now = time(); // or your date as well
                        $your_date = strtotime($data);
                        $datediff = $now - $your_date;

                        $order['estados'][$i]['diasPassados'] = floor($datediff / (60 * 60 * 24));

                        switch ($order['estados'][$i]['tipoDoc']) {
                            case "ECL":
                                $order['estados'][$i]['Informacao'] = "To be processed";
                                break;
                            case "GR":
                                $order['estados'][$i]['Informacao'] = "Delivering";
                                break;
                            case "FA":
                                $order['estados'][$i]['Informacao'] = "Invoice Issued";
                                break;
                            case "FR":
                                $order['estados'][$i]['Informacao'] = "Payment done";
                                break;
                            default:
                                $order['estados'][$i]['Informacao'] = "Unknown state";
                        }
                    }

                    $smarty->assign('order', $order);
                    $smarty->assign('order_id', $order_id);

                    $smarty->display('users/order_status.tpl');
                }
            }
            else
            {
                $smarty->display('common/notFound.tpl');
            }
        }
        else
        {
            $_SESSION['success_messages'][] = "You need to login to have access to this order.";
            header('Location: ' . $_SERVER['HTTP_REFERER']);
        }
    }

?>
