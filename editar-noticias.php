<?php
session_start();
include 'bd/conexao.php'
?>

<?php
$categoria=addslashes($_POST['categoria']);
$titulo=addslashes($_POST['titulo']);
$subtitulo=addslashes($_POST['subtitulo']);
$file_path= addslashes($_FILES['file']['tmp_name']);
$texto=addslashes($_POST['texto']);
$data_ed=addslashes($_POST['data_ed']);
$id = isset($_POST['id']) ? $_POST['id'] : null;

if (isset($_POST['publicado'])) {
	$publicado = 1;
} else {
	$publicado = 0;
}

$date = new DateTime($data_ed);
$dateFort = $date->format('Y,m,d H:i,s');
$file = file_get_contents($file_path);

if($file == false){

	$sql = ("UPDATE TB_NOTICIAS SET CATEGORIA = ?, TITULO = ?, SUBTITULO = ?, TEXTO = ?, DATA_ED = ? WHERE ID_NOT = ?");



	$stmt = $conn->prepare($sql);

	$stmt->bindParam(1, $categoria);
	$stmt->bindParam(2, $titulo);
	$stmt->bindParam(3, $subtitulo);
	$stmt->bindParam(4, $texto);
	$stmt->bindParam(5, $dateFort);
	$stmt->bindParam(6, $id);
	

	$result = $stmt->execute();

	$query = ("UPDATE TB_NOTICIAS SET  PUBLICADO = ? WHERE ID_NOT = ?");

	$stmt = $conn->prepare($query);

	$stmt->bindParam(1, $publicado);
	$stmt->bindParam(2, $id);

	$result2 = $stmt->execute();


		if ( ! $result && ! $result2 ){
			var_dump( $stmt->errorInfo() );
			exit;
		}

		$_SESSION['sucess-editado']=1;
		header('location:index-assoc.php');

}else{

	$sql = ("UPDATE TB_NOTICIAS SET CATEGORIA = ?, TITULO = ?, SUBTITULO = ?, TEXTO = ?, PUBLICADO = ?, DATA_ED = ?  WHERE ID_NOT = ?");

	$stmt = $conn->prepare($sql);

	$stmt->bindParam(1, $categoria);
	$stmt->bindParam(2, $titulo);
	$stmt->bindParam(3, $subtitulo);
	$stmt->bindParam(4, $texto);
	$stmt->bindParam(5, $id);
	$stmt->bindParam(6, $dateFort);
	$stmt->bindParam(7, $publicado);

	$result = $stmt->execute();

	$query1 = ("UPDATE TB_NOTICIAS SET  PUBLICADO = ? WHERE ID_NOT = ?");

	$stmt = $conn->prepare($query1);

	$stmt->bindParam(1, $publicado);
	$stmt->bindParam(2, $id);

	$result1 = $stmt->execute();

	$query = ("UPDATE TB_NOTICIAS SET ARQUIVO  = ? WHERE ID_NOT = ?");

		$stmt = $conn->prepare($query);
		
		$stmt->bindParam(1, $file);
		$stmt->bindParam(2, $id);

		$result2 = $stmt->execute();


		if ( ! $result && ! $result2 && ! $result1){
			var_dump( $stmt->errorInfo() );
			exit;
		}
		$_SESSION['sucess-editado']=1;
		header('location:index-assoc.php');
}

?>