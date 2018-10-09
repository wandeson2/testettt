<?php
include 'conexao.php';

$nome = htmlspecialchars($_POST["nome"]);
$email =htmlspecialchars ($_POST["email"]);
$login =htmlspecialchars ($_POST["login"]);
$senha = htmlspecialchars($_POST["senha"]);

$sql = "INSERT INTO usuario(USER_NOME,USER_EMAIL,USER_LOGIN,USER_SENHA)
VALUES(:nome, :email, :login, :senha)";
$stmt = $conn->prepare( $sql );
$stmt->bindParam( ':nome', $nome );
$stmt->bindParam( ':email', $email);
$stmt->bindParam( ':login', $login);
$stmt->bindParam( ':senha', $senha);

$result = $stmt->execute();

if ( ! $result ){
	var_dump( $stmt->errorInfo() );
	exit;
}
echo "<script>location.href='../login.php';</script>";
?>