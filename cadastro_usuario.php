<?php
include"cabeçalho.php"
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Cadastra-se</title>
	<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/util1.css">
    <link rel="stylesheet" type="text/css" href="css/main1.css">
    <link rel="stylesheet" type="text/css" href="css/blog-home.css">
</head>
<body>
    <form class="login100-form validate-form" action="bd/cadastrarUsuario.php" method="POST">
       <div class="login-box">
        <img src="img/1avatar.png" class="avatar">
        <h1>Cadastre-se</h1>
        <form>
            <p>Nome </p>
            <input type="te" name="nome" placeholder="Seu Nome Completo" required>
            <p>Email </p>
            <input type="em" name="email" placeholder="Seu email" required>
            <p>Nome de Usuário</p>
            <input type="uso" name="login" placeholder="Seu Login" required>
            <p>Senha</p>
            <input type="password" name="senha" placeholder="Sua Senha">



            <input type="submit" name="submit" value="Salvar">
        </form>


    </div>
</div>
</div>
</div>

</div>


</body>
</html>