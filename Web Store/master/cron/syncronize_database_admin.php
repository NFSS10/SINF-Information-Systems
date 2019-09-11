<?php
$conn = new PDO('pgsql:host=db.fe.up.pt;dbname=postgres', 'up201207133', 'MGMg5JEw5');
$conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

include_once('update_functions.php');

$url = "https://77.54.89.208:44300/api/synchronize";
$contextOptions = array(
    'ssl' => array(
        'allow_self_signed'=> true,
        'verify_peer'      => false,
        'verify_peer_name' => false,
    )
);

$sslContext = stream_context_create($contextOptions);
$resp = file_get_contents($url, false, $sslContext);
$data = json_decode($resp, true);

try
{
    $categories = getCategories();
    $stores = getStores();
    $users = getUsers();
    $products = getProducts();
}
catch (PDOException $e)
{
    die($e->getMessage());
}

if($data)
{
    // Update categories
    for($i = 0; $i < count($data['Familias']); $i++)
    {
        $exists = false;
        for($k = 0; $k < count($categories); $k++)
        {
            if($categories[$k]['idcategoria'] == $data['Familias'][$i]['Id'])
            {
                try
                {
                    updateCategory($data['Familias'][$i]['Id'], $data['Familias'][$i]['Nome']);
                    $exists = true;
                    break;
                }
                catch (PDOException $e)
                {
                    die($e->getMessage());
                }
            }

        }

        if($exists == false)
        {
            try
            {
                insertCategory($data['Familias'][$i]['Id'], $data['Familias'][$i]['Nome']);
            }
            catch (PDOException $e)
            {
                die($e->getMessage());
            }
        }
    }


    // Update Stores
    for($i = 0; $i < count($data['Armazens']); $i++)
    {
        $exists = false;
        for($k = 0; $k < count($stores); $k++)
        {
            if($stores[$k]['idloja'] == $data['Armazens'][$i]['Id'])
            {
                try
                {
                    updateStore($data['Armazens'][$i]['Id'], $data['Armazens'][$i]['Localidade']);
                    $exists = true;
                    break;
                }
                catch (PDOException $e)
                {
                    die($e->getMessage());
                }
            }

        }

        if($exists == false)
        {
            try
            {
                insertStore($data['Armazens'][$i]['Id'], $data['Armazens'][$i]['Localidade']);
            }
            catch (PDOException $e)
            {
                die($e->getMessage());
            }
        }
    }


    // Update users
    for($i = 0; $i < count($data['Clientes']); $i++)
    {
        for($k = 0; $k < count($users); $k++)
        {
            if(strtoupper($users[$k]['username']) == $data['Clientes'][$i]['CodCliente'])
            {
                try
                {
                    updateUser($users[$k]['username'], $data['Clientes'][$i]['NomeCliente'], $data['Clientes'][$i]['Morada'],
                        $data['Clientes'][$i]['Cpostal'], $data['Clientes'][$i]['Localidade'], $data['Clientes'][$i]['NumContribuinte']);
                    break;
                }
                catch (PDOException $e)
                {
                    die($e->getMessage());
                }
            }

        }
    }


    // Update products
    for($i = 0; $i < count($data['Artigos']); $i++)
    {
        $existsProduct = false;
        for($k = 0; $k < count($products); $k++)
        {
            if($products[$k]['idproduto'] == $data['Artigos'][$i]['CodArtigo'])
            {
                try
                {
                    updateProduct($data['Artigos'][$i]['NomeArtigo'], $data['Artigos'][$i]['Preco'], $data['Artigos'][$i]['Desconto'],
                        $data['Artigos'][$i]['Familia'], $data['Artigos'][$i]['CodArtigo']);

                    $existsProduct = true;

                    $stores = getStores();
                    for($j = 0; $j < count($stores); $j++)
                    {
                        $existsStore = false;

                        // Update stock
                        $stocks = $data['Artigos'][$i]['StockExistente'];
                        for($l = 0; $l < count($stocks); $l++)
                        {
                            if($stores[$j]['idloja'] == $stocks[$l]['armazemID'])
                            {
                                updateProductStock($data['Artigos'][$i]['CodArtigo'], $stocks[$l]['armazemID'], $stocks[$l]['unidades']);
                                $existsStore = true;
                                break;
                            }
                        }

                        if($existsStore == false)
                        {
                            try
                            {
                                createStockInStore($data['Artigos'][$i]['CodArtigo'], $stores[$j]['idloja'], 0);
                            }
                            catch (PDOException $e)
                            {}
                        }
                    }

                    break;
                }
                catch (PDOException $e)
                {
                    die($e->getMessage());
                }
            }
        }

        if($existsProduct == false)
        {
            try
            {
                insertProduct($data['Artigos'][$i]['NomeArtigo'], $data['Artigos'][$i]['Preco'], $data['Artigos'][$i]['Desconto'],
                    $data['Artigos'][$i]['Familia'], $data['Artigos'][$i]['CodArtigo']);


                $stocks = $data['Artigos'][$i]['StockExistente'];

                for($j = 0; $j < count($stocks); $j++)
                    createStockInStore($data['Artigos'][$i]['CodArtigo'], $stocks[$j]['armazemID'], $stocks[$j]['unidades']);


                $stores = getStores();
                for($j = 0; $j < count($stores); $j++)
                {
                    $existsStore = false;

                    // Update stock
                    for($l = 0; $l < count($stocks); $l++)
                    {
                        if($stores[$j]['idloja'] == $stocks[$l]['armazemID'])
                        {
                            $existsStore = true;
                            break;
                        }
                    }

                    if($existsStore == false)
                        createStockInStore($data['Artigos'][$i]['CodArtigo'], $stores[$j]['idloja'], 0);
                }
            }
            catch (PDOException $e)
            {
                die($e->getMessage());
            }
        }
    }

}

    header('Location: ' . $_SERVER['HTTP_REFERER']);

?>