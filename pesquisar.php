<?php include 'cabeçalho.php'; ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>pesquisar</title>
</head>
<body>
<br>
<br>
<br>
<br>
<table class="table" border="1px" style="background: #C0C0C0;">
  <tr>
    <th>Nome </th>
    <th>CPF</th>
    <th>Endereco</th>
    <th>Bairro</th>
    <th>Deletar</th>
    <th>Editar</th>
    <th>Detalhes</th>
  </tr>
  <?php
  require_once 'bd/conexao.php';
// Monta outra consulta MySQL para a busca
  $buscar = $_POST['pesquisa'];

  $stmt = $conn->query("SELECT *
    FROM pescadores
    INNER JOIN estado_civil ON pescadores.id_estado = estado_civil.id_estado  WHERE nome LIKE '%".$buscar."%'");
  $cadastro = $stmt->fetchAll();
  foreach ($cadastro as $dados) {
    $pescador_id = $dados['pescador_id'];
    $nome=$dados['nome'];
    $cpf = $dados['cpf'];
    $endereco = $dados['endereco'];
    $bairro = $dados['bairro'];
    echo "<tr>
    <td>"."$nome"."</td>
    <td>"."$cpf"."</td>
    <td>"."$endereco"."</td>
    <td>"."$bairro"."</td>
    <td><a  href='bd/excluir.php?id=".$pescador_id."'>Excluir</a></td>
    <td><a  href='formulario_editar.php?id=".$pescador_id."'>Editar</a></td>
    <td><a  href='detalhes_pescador.php?id=".$pescador_id."' >Mais detalhes</a></td>
    </tr>";
  }
  ?>
</table><a class="btn btn-secondary" href='armazenamento.php'>Voltar</a>
<?php 
include 'rodape.php'; 
?>
</body>