<?php 
session_start();
include 'bd/conexao.php';
?>

<?php 

$id = isset($_GET['id'])? (int) $_GET['id'] : null;
    //Valida a variavel da URL
    if (empty($id)){
      echo "ID para alteração não definido";
    exit;
    }
$query = "SELECT PUBLICADO FROM TB_NOTICIAS WHERE ID_NOT = '$id'";
  $stmt = $conn->prepare($query);
  $res = $stmt->execute();
  $campos = $stmt->fetch(PDO::FETCH_ASSOC);
  $pubicado = $campos['PUBLICADO'];

if ($pubicado == 1) {
	$_SESSION['msg-despublique']=1;
	header('location:index-assoc.php');

}else {
  $id = isset($_GET['id'])? (int) $_GET['id'] : null;
    //Valida a variavel da URL
    if (empty($id)){
      echo "ID para alteração não definido";
    exit;
    }

$query = ("DELETE FROM TB_COMENTARIO WHERE ID_NOT = '$id'");

$stmt = $conn->prepare($query);
$result2= $stmt->execute();

$sql = ("DELETE FROM TB_NOTICIAS WHERE ID_NOT = '$id'");

$stmt = $conn->prepare($sql);

// $stmt->bindParam(1, $id);

$result = $stmt->execute();

if ( ! $result && ! $result2){
			var_dump( $stmt->errorInfo() );
			exit;
		}
		$_SESSION['sucess-excluido']=1;
		header('location:index-assoc.php');
}

?>