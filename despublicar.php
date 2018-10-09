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
  $publicado = $campos['PUBLICADO'];

if ($publicado == 1) {

  $publicado = 0;

  $sql = ("UPDATE TB_NOTICIAS SET PUBLICADO = ? WHERE ID_NOT = ?");

  $stmt = $conn->prepare($sql);

  $stmt->bindParam(1, $publicado);
  $stmt->bindParam(2, $id);

  $result = $stmt->execute();

    if ( ! $result){
      var_dump( $stmt->errorInfo() );
      exit;
    }

    $_SESSION['sucess-despublicado']=1;
    header('location:index-assoc.php');
	// $_SESSION['msg-despublique']=1;
	}// header('location:index-assoc.php');
?>