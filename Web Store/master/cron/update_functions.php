<?php

    function getCategories()
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * from categoria;");

        $stmt->execute();
        return $stmt->fetchAll();
    }

    function updateCategory($id, $nome)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE categoria SET nome = ? WHERE idcategoria = ?");
        $stmt->execute(array($nome, $id));
    }

    function insertCategory($id, $nome)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO categoria (idcategoria, nome) VALUES (?, ?)");
        $stmt->execute(array($id, $nome));
    }

    function getStores()
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * from loja;");

        $stmt->execute();
        return $stmt->fetchAll();
    }

    function updateStore($id, $localidade)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE loja SET localidade = ? WHERE idloja = ?");
        $stmt->execute(array($localidade, $id));
    }

    function insertStore($id, $localidade)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO loja (idloja, localidade) VALUES (?, ?)");
        $stmt->execute(array($id, $localidade));
    }

    function getUsers()
    {
        global $conn;
        $stmt = $conn->prepare("SELECT username, nome, morada, cpostal, localidade, nif from utilizador;");

        $stmt->execute();
        return $stmt->fetchAll();
    }

    function updateUser($username, $nome, $morada, $cpostal, $localidade, $nif)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE utilizador SET nome = ?, morada = ?, cpostal = ?, localidade = ?, nif = ? WHERE username = ?");
        $stmt->execute(array($nome, $morada, $cpostal, $localidade, $nif, $username));
    }

    function getProducts()
    {
        global $conn;
        $stmt = $conn->prepare("SELECT * from produto;");

        $stmt->execute();
        return $stmt->fetchAll();
    }

    function updateProduct($nome, $preco, $desconto, $categoria, $idproduto)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE produto SET nome = ?, preco = ?, desconto = ?, categoria = ? WHERE idproduto = ?");
        $stmt->execute(array($nome, $preco, $desconto, $categoria, $idproduto));
    }

    function updateProductStock($idproduto, $idLoja, $quantidade)
    {
        global $conn;
        $stmt = $conn->prepare("UPDATE produtoloja SET unidades = ? WHERE idproduto = ? AND idloja = ?");
        $stmt->execute(array($quantidade, $idproduto, $idLoja));
    }

    function createStockInStore($idproduto, $idLoja, $quantidade)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO produtoloja (unidades, idproduto, idloja) VALUES (?, ?, ?)");
        $stmt->execute(array($quantidade, $idproduto, $idLoja));
    }

    function insertProduct($nome, $preco, $desconto, $categoria, $idproduto)
    {
        global $conn;
        $stmt = $conn->prepare("INSERT INTO produto (idproduto, nome, preco, desconto, categoria) VALUES (?,?,?,?,?)");
        $stmt->execute(array($idproduto, $nome, $preco, $desconto, $categoria));
    }
