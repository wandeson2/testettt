<?php
require_once 'conexao.php';

$pescador_id = $_GET['id'];
    $sql = "DELETE FROM pescadores WHERE pescador_id = :pescador_id";

    $stmt = $conn->prepare($sql);

    $stmt->bindParam(":pescador_id",$pescador_id);
    $result = $stmt->execute();
        if ( ! $result ){
            var_dump( $stmt->errorInfo() );
            exit;
        }

    header('location: ../armazenamento.php');
?> 