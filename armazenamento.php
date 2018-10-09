<?php
require_once "cabeçalho.php";
?>
<!DOCTYPE html>
<html>
<head>
    <title>Colonia</title>
    <meta charset="utf-8">
</head>
<body>

    <div class="card my-4">
        <h5 class="card-header">Pesquisar</h5>
        <div class="card-body">
            <div class="input-group">
                <form action="pesquisar.php" method="POST">
                    <input type="text" name="pesquisa" placeholder="Pesquise Aqui..." required>
                    <span class="input-group-btn">
                        <input class="btn btn-secondary" type="submit" value="pesquisar"></input>
                        <a class="btn btn-secondary" href='cadastro_pescadores.php'>Cadastre Um Novo Pescador</a>
                    </span>
                </form>
            </div>
        </div>
    </div>
    
    <table class="table" border="1px" style="background: #C0C0C0;">
        <tr>
            <th>Nome</th>
            <th>CPF</th>
            <th>Endereco</th>
            <th>Bairro</th>
            <th>Deletar</th>
            <th>Editar</th>
            <th>Detalhes</th>
        </tr>
        <?php
        require_once 'bd/conexao.php';
        $stmt = $conn->query("SELECT *
            FROM pescadores
            INNER JOIN estado_civil ON pescadores.pescador_id = estado_civil.id_estado");

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
    </table>
    <?php include 'rodape.php'; ?>
</body>
</html>