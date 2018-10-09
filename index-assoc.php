<?php 
session_start();
include_once 'cabeçalho.php';
include 'bd/conexao.php';
?>
<br>
<br>
<br>
<br>
<br>
<div class="container">
  
  <?php
  $user = $_SESSION['login'];

  $sql = "SELECT USER_NOME FROM usuario WHERE USER_NOME = '$user'";
  $stmt = $conn->prepare($sql);
  $res = $stmt->execute();

  $campos = $stmt->fetch(PDO::FETCH_ASSOC);

  $nome = $campos['USER_NOME'];

  ?>
  <center><h2><?php echo $nome; ?></h2></center>

  <?php if(isset($_SESSION['sucess-despublicado'])):?>
    <center><span class="sucess-editado"> Notícia despublicada com sucesso!!! </span></center> 
    <?php unset($_SESSION['sucess-despublicado']); ?>
  <?php  endif;?>

  <?php if(isset($_SESSION['sucess-publicado'])):?>
    <center><span class="sucess-editado"> Notícia publicada com sucesso!!! </span></center> 
    <?php unset($_SESSION['sucess-publicado']); ?>
  <?php  endif;?>

  <?php if(isset($_SESSION['sucess-editado'])):?>
    <center><span class="sucess-editado"> Notícia editada com sucesso!!! </span></center> 
    <?php unset($_SESSION['sucess-editado']); ?>
  <?php  endif;?>

  <?php if (isset($_SESSION['sucess-excluido'])):?>
    <center><span class="sucess-editado"> Notícia excluída com sucesso!!! </span></center> 
  <?php unset($_SESSION['sucess-excluido']); ?>
  <?php  endif;?>

    <?php if (isset($_SESSION['msg-despublique'])):?>
    <center><span class="msg-despublique"> Você precisa despublicar está notícia para exclui-lá!!!  </span></center> 
  <?php unset($_SESSION['msg-despublique']); ?>
  <?php  endif;?>

  <div class="row">
    </div>
      <div class="col-md-12">
        <h4><i class="fas fa-th-list"></i> Minhas Notícias</h4>
        <div class="table-responsive">
          <table id="mytable" class="table table-bordred table-striped">
            <thead>
              <th>Título</th>
              <th>Categoria</th>
              <th>Data/Hora</th>
              <th>Ler/Editar</th>
              <th>Deletar</th>
              <th>Publicar/Despublicar</th>
            </thead>
              
                <?php
                $user = $_SESSION['login'];

                $query = "SELECT * FROM usuario, TB_NOTICIAS WHERE TB_NOTICIAS.id_usuario = usuario.id_usuario AND usuario.USER_LOGIN = '$user' ORDER BY DATA DESC";
                $stmt = $conn->prepare($query);
                $res = $stmt->execute();
                $rows = $stmt->rowCount();  
  
                  if ($rows <=0) {
                      echo "<tbody>
                              <tr>
                                <td>Você ainda não possui notícias cadastradas.</td>
                              <tr>
                            </tbody>";
                  } else{
              ?>
              
              <?php
                while ($campos = $stmt->fetch(PDO::FETCH_ASSOC)) {
                      $id = $campos['ID_NOT'];
                      $titulo = $campos['TITULO'];
                      $categoria = $campos['CATEGORIA'];
                      $data = $campos['DATA'];
                      $publicado = $campos['PUBLICADO'];

              ?>

              <tbody>
                <tr>
                  <td><?php echo $titulo; ?></td>
                  <td><?php echo $categoria; ?></td>
                  <td><?php echo $data; ?></td>
                  <td><p data-placement="top" data-toggle="tooltip" title="Editar"><a href="form-editar-not.php?id=<?=$id?>" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></a></p></td>
                  <td><p data-placement="top" data-toggle="tooltip" title="Deletar"><a href="deletar-not.php?id=<?=$id?>" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-trash"></span></a></p></td>
                  <?php if ($publicado==1){?>
                  <td><p data-placement="top" data-toggle="tooltip" title="Despublicar"><a href="despublicar.php?id=<?=$id?>" class="btn btn-warning btn-xs"><i class="fas fa-check-square"></i></span></a></p></td>
                  <?php }else{?>
                  <td><p data-placement="top" data-toggle="tooltip" title="Publicar"><a href="publicar.php?id=<?=$id?>" class="btn btn-success btn-xs"><i class="fas fa-check-square"></i></span></a></p></td>
                  <?php } ?>

                 </tr>
              <?php
               }
            }

            ?>
          </tbody>
        
        </table>
      </div>
    </div>
  </div>

<?php
include 'rodape.php';
?>

</body>
</html>