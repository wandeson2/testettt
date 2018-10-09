<?php
require 'bd/conexao.php';
if(!isset($_SESSION['logado'])){
  $_SESSION['logado'] = [];
}
if(isset($_SESSION["login"]) && isset($_SESSION["senha"])){
  $llogin = $_SESSION['login'];
  $ssenha = $_SESSION['senha'];
}
?>

<!DOCTYPE html>
<html lang="en">

  <head>
    <link rel = "shortcut icon" type = "imagem/x-icon" href = "/imagem/favicon.ico"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/blog-home.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <p><a class="navbar-brand" href="index.php"><img src="imagem/logo.png" height="25" width="40">Colônia De Pescadores Z-10</a></p>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">

            <li class="nav-item">
              <a class="nav-link" href="sobre.php">Quem Somos</a>
            </li>
<?php
        if($_SESSION['logado'] == True):
          $llogin = $_SESSION['login'];
          $ssenha = $_SESSION['senha'];

          $sql ="SELECT * FROM usuario WHERE USER_LOGIN = '$llogin' and USER_SENHA = '$ssenha'";
          $stmt = $conn->query($sql);
          foreach ($stmt as $dados) {
            echo "
            <li class= 'nav-item'><a class='nav-link' href='logout.php'>Bem Vindo $llogin
            Sair</a></li>";
          }

          ?>
            <?php else:
              echo "
                <li class='nav-item'><a class='nav-link' href='login.php'>Entrar</a></li>";
              endif
              ?>
          </ul>
        </div>
      </div>
    </nav>