<?php

    function editUserInfo($username, $name, $bday, $address, $town, $cpostal)
    {
        global $conn;
        $stmt = $conn->prepare(
            "UPDATE utilizador SET nome = ?, datanascimento = ?, morada = ?, localidade = ?, cpostal = ? WHERE username = ? "
        );
        $stmt->execute(array($name, $bday, $address, $town, $cpostal, $username));
    }

    function getUserInfo($user_id)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT * 
			FROM utilizador
			WHERE idUtilizador = ?");

        $stmt->execute(array($user_id));
        return $stmt->fetch();
    }

    function getUserInfoByUsername($user_name)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT * 
			FROM utilizador
			WHERE username = ?");

        $stmt->execute(array($user_name));
        return $stmt->fetch();
    }

    function getUserFavouritesIDs($user_id)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT idProduto 
                FROM favorito
                WHERE idUtilizador = ?");

        $stmt->execute(array($user_id));
        return $stmt->fetchAll();
    }

    function checkIfUsernameExists($username) {
        global $conn;
        $stmt = $conn->prepare("SELECT *
                                      FROM utilizador
                                      WHERE username = ?");
        $stmt->execute(array($username));
        return $stmt->fetchAll();
    }

    function checkIfEmailExists($email) {
        global $conn;
        $stmt = $conn->prepare("SELECT *
                                          FROM utilizador
                                          WHERE email = ?");
        $stmt->execute(array($email));
        return $stmt->fetchAll();
    }

    function newUser($username, $password, $email, $nome, $nif, $address, $town, $postalcode, $bday, $regday)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO utilizador (username, password, email, nome, nif, morada, localidade, cPostal, dataNascimento, dataRegisto)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute(array($username, $password, $email, $nome, $nif, $address, $town, $postalcode, $bday, $regday));
    }

    function getUser($identifier){
        global $conn;
        $stmt = $conn->prepare(
            "SELECT password, idUtilizador, username, admin
				FROM utilizador
				WHERE username = ? OR email = ?;");
        $stmt->execute(array($identifier, $identifier));
        return $stmt->fetch();
    }

    function checkIfOrderExists($idOrdem, $idutilizador)
    {
        global $conn;
        $stmt = $conn->prepare(
            "SELECT * FROM ordem WHERE idordem = ? AND comprador = ?;");
        $stmt->execute(array($idOrdem, $idutilizador));
        return $stmt->fetch();
    }

    function createOrder($idOrdem, $idUtilizador)
    {
        global $conn;
        $stmt = $conn->prepare(
            "INSERT INTO ordem (idordem, comprador) VALUES (?, ?)");
        $stmt->execute(array($idOrdem, $idUtilizador));
    }

    function createReviewInAOrder($idOrdem, $pontuacao, $idProduto)
    {
        global $conn;
        $stmt = $conn->prepare(
            "INSERT INTO review (idproduto, idordem, pontuacao) VALUES (?, ?, ?)");
        $stmt->execute(array($idProduto, $idOrdem, $pontuacao));
    }