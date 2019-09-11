<?php

    function getAllUsers()
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT * 
			FROM utilizador");

        $stmt->execute();
        return $stmt->fetchAll();
    }
	
	function getAllReviews()
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT utilizador.username, produto.nome, pontuacao, produto.categoria
			FROM review 
			JOIN produto ON  review.idProduto = produto.idProduto 
			JOIN ordem ON ordem.idOrdem = review.idOrdem 
			JOIN utilizador ON ordem.comprador = utilizador.idUtilizador"
			);
		
        $stmt->execute();
        return $stmt->fetchAll();
    }
?>