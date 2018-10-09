<?php
require_once 'bd/conexao.php';?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Autenticação</title>
	<script type="text/javascript">
		function loginsucess(){
			window.location='index.php';
		}
		function loginfailed(){
			window.location='login.php';
		}
	</script>
</head>
<body>

<?php
$login = $_POST['login'];
$senha = $_POST['senha'];
$stmt = $conn->prepare("SELECT * FROM usuario WHERE USER_LOGIN = '$login' and USER_SENHA = '$senha'");
$stmt->bindParam(1,$login);
$stmt->bindParam(2,$senha);
$stmt->execute();
$dados = $stmt->fetch(PDO::FETCH_ASSOC);
if ($dados == NULL){
    header('location:../login.php');
}
else {
    $_SESSION['login'] = $login;
	$_SESSION['senha'] = $senha;
	$_SESSION['logado'] = True;
	$_SESSION['user_id'] = $dados['id_usuario'];
	    header('location:index.php');
}
?>
</body>
</html>