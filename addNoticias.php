<?php
session_start();
include 'bd/conexao.php';
?>
<?php

$id_usuario = $_SESSION['user_id'];

$categoria=addslashes($_POST['categoria']);
$titulo=addslashes($_POST['titulo']);
$subtitulo=addslashes($_POST['subtitulo']);
$file_path= addslashes($_FILES['file']['tmp_name']);
$texto=addslashes($_POST['texto']);

if (isset($_POST['publicado'])) {
	$publicado = 1;
} else {
	$publicado = 0;
}


$file = file_get_contents($file_path);


 $stmt = $conn->prepare("SELECT id_usuario FROM usuario WHERE id_usuario = '$id_usuario'");
 $stmt->execute();
 $result = $stmt->fetch(PDO::FETCH_ASSOC);

$id_usuario = $result['id_usuario'];

$sql ="INSERT INTO TB_NOTICIAS (CATEGORIA, TITULO, SUBTITULO, ARQUIVO, TEXTO, id_usuario, PUBLICADO) VALUES(:categoria, :titulo, :subtitulo, :file, :texto, :id_usuario, :publicado)";

$stmt = $conn->prepare( $sql );

$stmt->bindParam( ':categoria', $categoria);
$stmt->bindParam( ':titulo', $titulo);
$stmt->bindParam( ':subtitulo', $subtitulo);
$stmt->bindParam( ':file', $file);
$stmt->bindParam( ':texto', $texto);
$stmt->bindParam( ':id_usuario', $id_usuario);
$stmt->bindParam( ':publicado', $publicado);

$result = $stmt->execute();
if ( ! $result ){
	var_dump( $stmt->errorInfo() );
	exit;
}

header('location:index-assoc.php');
?>