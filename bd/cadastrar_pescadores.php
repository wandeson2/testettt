<?php
include 'conexao.php';

$matricula = htmlspecialchars($_POST["matricula"]);
$nome = htmlspecialchars($_POST["nome"]);
$endereco = htmlspecialchars($_POST["endereco"]);
$bairro = htmlspecialchars($_POST["bairro"]);
$estado = htmlspecialchars($_POST["estado"]);
$cpf = htmlspecialchars($_POST["cpf"]);
$titulo = htmlspecialchars($_POST["titulo"]);
$profissional = htmlspecialchars($_POST["profissional"]);
$pis = htmlspecialchars($_POST["pis"]);
$nascimento = htmlspecialchars($_POST["nascimento"]);
$rgp = htmlspecialchars($_POST["rgp"]);
$nome_pai = htmlspecialchars($_POST["nome_pai"]);
$nome_mae = htmlspecialchars($_POST["nome_mae"]);
$dependente = htmlspecialchars($_POST["dependente"]);
$data_ins = htmlspecialchars($_POST["data_ins"]);
$insc_inss = htmlspecialchars($_POST["insc_inss"]);
$rg = htmlspecialchars($_POST["rg"]);
$orgao = htmlspecialchars($_POST["orgao"]); 
// $assinatura_socio = htmlspecialchars($_POST["assinatura_socio"]);
// $assinatura_presidente = htmlspecialchars($_POST["assinatura_presidente"]);
$estado_civil = htmlspecialchars($_POST["estado_civil"]);
$file_path= addslashes($_FILES['file']['tmp_name']);

$file = file_get_contents($file_path);
 // var_dump($file);

$sql ="INSERT INTO pescadores (matricula, nome, endereco, bairro, estado, cpf, titulo, profissional, pis, nascimento, rgp, nome_pai, nome_mae, dependente, data_ins, insc_inss, rg, orgao, id_estado, ARQUIVO)

VALUES (:matricula, :nome, :endereco, :bairro, :estado, :cpf, :titulo, :profissional, :pis, :nascimento, :rgp, :nome_pai, :nome_mae, :dependente, :data_ins, :insc_inss, :rg, :orgao, :estado_civil, :file)";

$stmt = $conn->prepare( $sql );
$stmt->bindParam( ':matricula', $matricula);
$stmt->bindParam( ':nome', $nome);
$stmt->bindParam( ':endereco', $endereco);
$stmt->bindParam( ':bairro', $bairro);
$stmt->bindParam( ':estado', $estado);
$stmt->bindParam( ':cpf', $cpf);
$stmt->bindParam( ':titulo', $titulo);
$stmt->bindParam( ':profissional', $profissional);
$stmt->bindParam( ':pis', $pis);
$stmt->bindParam( ':nascimento', $nascimento);
$stmt->bindParam( ':rgp', $rgp);
$stmt->bindParam( ':nome_pai', $nome_pai);
$stmt->bindParam( ':nome_mae', $nome_mae);
$stmt->bindParam( ':dependente', $dependente);
$stmt->bindParam( ':data_ins', $data_ins);
$stmt->bindParam( ':insc_inss', $insc_inss);
$stmt->bindParam( ':rg', $rg);
$stmt->bindParam( ':orgao', $orgao);
$stmt->bindParam( ':estado_civil', $estado_civil);
$stmt->bindParam( ':file', $file);
$result = $stmt->execute();
if ( ! $result ){
	var_dump( $stmt->errorInfo() );
	exit;
}
echo "<script>location.href='../armazenamento.php';</script>";
?>