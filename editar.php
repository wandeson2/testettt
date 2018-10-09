<?php
 require_once 'bd/functions.php';
require_once 'bd/conexao.php';
 // pega os dados do formuário
             
$pescador_id = isset($_GET['id']) ? (int) $_GET['id'] : null;

$matricula = isset($_POST['matricula']) ? $_POST['matricula'] : null;
$nome = isset($_POST['nome']) ? $_POST['nome'] : null;
$endereco = isset($_POST['endereco']) ? $_POST['endereco'] : null;
$bairro = isset($_POST['bairro']) ? $_POST['bairro'] : null;
$estado = isset($_POST['estado']) ? $_POST['estado'] : null;
$cpf = isset($_POST['cpf']) ? $_POST['cpf'] : null;
$titulo = isset($_POST['titulo']) ? $_POST['titulo'] : null;
$profissional = isset($_POST['profissional']) ? $_POST['profissional'] : null;
$pis = isset($_POST['pis']) ? $_POST['pis'] : null;
$nascimento = isset($_POST['nascimento']) ? $_POST['nascimento'] : null;
$rgp = isset($_POST['rgp']) ? $_POST['rgp'] : null;
$nome_pai = isset($_POST['nome_pai']) ? $_POST['nome_pai'] : null;
$nome_mae = isset($_POST['nome_mae']) ? $_POST['nome_mae'] : null;
$dependente = isset($_POST['dependente']) ? $_POST['dependente'] : null;
$data_ins = isset($_POST['data_ins']) ? $_POST['data_ins'] : null;
$insc_inss = isset($_POST['insc_inss']) ? $_POST['insc_inss'] : null;
$rg = isset($_POST['rg']) ? $_POST['rg'] : null;
$orgao = isset($_POST['orgao']) ? $_POST['orgao'] : null;
$estado_civil = isset($_POST['estado_civil']) ? $_POST['estado_civil'] : null;
$ARQUIVO = isset($_POST['ARQUIVO']) ? $_POST['ARQUIVO'] : null;

 // validação para evitar dados vazios
if (($matricula) || ($nome) || ($endereco) || ($bairro) || ($estado) || ($cpf) || ($titulo) || ($profissional) || ($pis) || ($nascimento) || ($rgp)|| ($nome_pai) || ($nome_mae) || ($dependente) || ($data_ins) || ($insc_inss) ||
    ($rg) || ($orgao)|| ($estado_civil) || ($ARQUIVO))
{
    echo "Volte e preencha todos os campos";
    exit;
}
 // insere no banco
$PDO = db_connect();
$sql_msg_contatos = ("UPDATE pescadores SET
:matricula = matricula,
:nome = nome,
:endereco = endereco,
:bairro = bairro,
:estado = estado,
:cpf = cpf,
:titulo = titulo,
:profissional = profissional,
:pis = pis,
:nascimento = nascimento,
:rgp = rgp,
:nome_pai = nome_pai,
:nome_mae = nome_mae,
:dependente = dependente,
:data_ins = data_ins,
:insc_inss = insc_inss,
:rg = rg,
:orgao = orgao,
:id_estado = estado_civil, 
:ARQUIVO = ARQUIVO WHERE pescador_id = :pescador_id");

$insert_msg_contato = $PDO->prepare($sql_msg_contatos);
$insert_msg_contato->bindParam(':pescador_id', $pescador_id, PDO::PARAM_INT);
$insert_msg_contato->bindParam(':matricula', $matricula);
$insert_msg_contato->bindParam(':nome', $nome);
$insert_msg_contato->bindParam(':endereco', $endereco);
$insert_msg_contato->bindParam(':bairro', $bairro);
$insert_msg_contato->bindParam(':estado', $estado);
$insert_msg_contato->bindParam(':cpf', $cpf);
$insert_msg_contato->bindParam(':titulo', $titulo);
$insert_msg_contato->bindParam(':profissional', $profissional);
$insert_msg_contato->bindParam(':pis', $pis);
$insert_msg_contato->bindParam(':nascimento', $nascimento);
$insert_msg_contato->bindParam(':rgp', $rgp);
$insert_msg_contato->bindParam(':nome_pai', $nome_pai);
$insert_msg_contato->bindParam(':nome_mae', $nome_mae);
$insert_msg_contato->bindParam(':dependente', $dependente);
$insert_msg_contato->bindParam(':data_ins', $data_ins);
$insert_msg_contato->bindParam(':insc_inss', $insc_inss);
$insert_msg_contato->bindParam(':rg', $rg);
$insert_msg_contato->bindParam(':orgao', $orgao);
$insert_msg_contato->bindParam(':estado_civil', $estado_civil);
$insert_msg_contato->bindParam(':ARQUIVO', $ARQUIVO);
 if ($insert_msg_contato->execute()){
    header('Location:../armazenamento.php');
}else{
    echo "Erro ao cadastrar";
    print_r($insert_msg_contato->errorInfo());
}
?>
</body>
</html> 