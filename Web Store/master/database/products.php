<?php

    function getProductInfoById($product_id)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT idProduto, produto.nome as nome, preco, imagem, descricao, requisitos, categoria.nome as categoria, dataLancamento, video, desconto, produto.categoria as idcategoria, genero
                        FROM produto INNER JOIN categoria
                            ON produto.categoria = categoria.idCategoria
                        WHERE idProduto = ?;");

        $stmt->execute(array($product_id));
        return $stmt->fetch();
    }

    function getQuantityStoresByProduct($product_id)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT loja.idLoja AS idLoja, localidade, unidades
                        FROM loja INNER JOIN produtoloja
                            ON loja.idLoja = produtoloja.idLoja
                        WHERE idProduto = ?;");

        $stmt->execute(array($product_id));
        return $stmt->fetchAll();
    }

    function getAverageRating($product_id)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT AVG(pontuacao) AS pontuacao 
                          FROM review INNER JOIN produto 
                              ON review.idProduto = produto.idProduto
                            WHERE review.idProduto = ?");

        $stmt->execute(array($product_id));
        return $stmt->fetch();
    }

    function getNewestProducts()
    {
        global $conn;
        $stmt = $conn->prepare("
          SELECT imagemdestaque, nome FROM
                (SELECT DISTINCT nome, datalancamento, imagemDestaque
                 FROM produto where datalancamento IS NOT NULL) As newest
            ORDER BY datalancamento DESC
           LIMIT 5");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getTopTenProducts(){
        global $conn;
        $stmt = $conn->prepare("
            SELECT AVG(pontuacao) AS pontuacao, produto.idProduto as idProduto, imagem, preco, nome, sum(unidades) as stkAtual
FROM review RIGHT JOIN produto
    ON review.idProduto = produto.idProduto
  INNER JOIN produtoloja ON produto.idproduto = produtoloja.idproduto
GROUP BY produto.idProduto, imagem, preco, nome
ORDER BY pontuacao
LIMIT 10");

        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getBestDiscounts(){
        global $conn;
        $stmt = $conn->prepare("
            SELECT AVG(pontuacao) AS pontuacao, produto.idproduto as idproduto, preco, desconto, imagem, nome, sum(unidades) as stkAtual
                FROM review RIGHT JOIN produto
                    ON review.idProduto = produto.idProduto
                  INNER JOIN produtoloja ON produto.idproduto = produtoloja.idproduto
                WHERE desconto > 0
                Group By produto.idproduto, preco, desconto, imagem
                ORDER BY desconto DESC
                LIMIT 12");

        $stmt->execute();
        return $stmt->fetchAll();
    }

    function alreadyExistsReview($product_id, $username, $ordem_id)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT * FROM ordem INNER JOIN utilizador
                        ON ordem.comprador = utilizador.idUtilizador
                      INNER JOIN review
                        ON review.idordem = ordem.idordem
                    WHERE review.idProduto = ? AND utilizador.username = ? AND ordem.idordem = ?;");

        $stmt->execute(array($product_id, $username, $ordem_id));
        return $stmt->fetchAll();
    }

    function addWishedProduct($user_id, $product_id)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO favorito (idproduto, idutilizador)
                VALUES (?, ?)");
        $stmt->execute(array($product_id, $user_id));
    }

    function removeWishedProduct($user_id, $product_id)
    {
        global $conn;
        $stmt = $conn->prepare("DELETE FROM favorito WHERE idutilizador = ? AND idproduto = ?");
        $stmt->execute(array($user_id, $product_id));
    }

    function isFavorite($username, $productID){
        global $conn;
        $stmt = $conn->prepare(
            "SELECT * FROM 
                              utilizador INNER JOIN favorito 
                                ON utilizador.idutilizador = favorito.idutilizador
                            WHERE username = ? AND favorito.idproduto = ?");
        $stmt->execute(array($username, $productID));
        return $stmt->fetch();
    }

    function getFavorites($userID){
        global $conn;
        $stmt = $conn->prepare(
            "SELECT favorito.idproduto as idproduto, produto.nome, preco, desconto, imagem, categoria.nome as categoria FROM
                              favorito INNER JOIN produto
                                ON favorito.idproduto = produto.idproduto
                                  INNER JOIN categoria ON categoria.idcategoria = categoria
                                WHERE idutilizador = ?");
        $stmt->execute(array($userID));
        return $stmt->fetchAll();
    }

    function getProductsSearch($query){
        global $conn;
        $stmt = $conn->prepare(
            "SELECT search.idproduto, nome, descricao, preco, imagem, desconto, datalancamento, categoria, sum(unidades) as stkAtual FROM
                          (SELECT produto.idproduto as idproduto, produto.nome, produto.descricao, produto.preco, produto.imagem, produto.desconto, produto.datalancamento,
                               COALESCE(string_agg(DISTINCT categoria.nome, ', '), '') AS categoria
                        FROM produto
                          INNER JOIN (SELECT idproduto, ts_rank(documento, plainto_tsquery('english', ?)) AS rank
                                      FROM procurar_produto
                                      WHERE documento @@ plainto_tsquery('english', ?)) AS procurar
                            ON produto.idproduto = procurar.idproduto
                          LEFT JOIN categoria ON categoria.idcategoria = produto.categoria
                        GROUP BY produto.idproduto, procurar.rank) as search
                        INNER JOIN produtoloja ON search.idproduto = produtoloja.idproduto
                        GROUP BY search.idproduto, nome, descricao, preco, imagem, desconto, datalancamento, categoria;");
        $stmt->execute(array($query, $query));
        return $stmt->fetchAll();
    }

    function getProductsSearchPlatform($platform){
        global $conn;
        $stmt = $conn->prepare(
            "SELECT produto.idproduto, produto.nome, produto.datalancamento ,produto.desconto, produto.descricao, produto.imagem, produto.categoria, produto.preco, sum(unidades) as stkAtual FROM produto
                      INNER JOIN produtoloja
                      ON produto.idproduto = produtoloja.idproduto
                    WHERE produto.categoria = ?
                    GROUP BY produto.idproduto;");
        $stmt->execute(array($platform));
        return $stmt->fetchAll();
    }

    function getCheckoutProducts($string)
    {
        global $conn;
        $stmt = $conn->prepare( "
          SELECT imagem, nome, preco, desconto, idproduto FROM produto WHERE " . $string . " ORDER BY nome ASC");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getCheckoutProductsCheckoutPage($string)
    {
        global $conn;
        $stmt = $conn->prepare( "
              SELECT idproduto, imagem, produto.nome as nome, preco, desconto, categoria.nome as categoria FROM produto INNER JOIN categoria ON 
              produto.categoria = categoria.idcategoria WHERE " . $string . " ORDER BY nome ASC");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getDescriptionPlatform($platform)
    {
        global $conn;
        $stmt = $conn->prepare( "
                  SELECT * from categoria where idcategoria = ?");
        $stmt->execute(array($platform));
        return $stmt->fetch();
    }

    function getRelatedProducts($name, $platform, $genre)
    {
        global $conn;
        $stmt = $conn->prepare( "
                  SELECT * from produto WHERE (nome = ?  AND produto.categoria != ?) OR (nome != ?) AND genero = ?");
        $stmt->execute(array($name, $platform, $name, $genre));
        return $stmt->fetchAll();
    }



