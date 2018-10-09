<?php 
session_start();
include "cabecalho.php";
include 'bd/conexao.php';
?>
<main>

<?php
// pega o ID da URL
    $id = isset($_GET['id']) ? (int) $_GET['id'] : null;
    //Valida a variavel da URL
    if (empty($id)){
      echo "ID para alteração não definido";
    exit;
    }
    $sql = "SELECT * FROM TB_NOTICIAS, TB_ASSOCIACOES WHERE ID_NOT='$id' AND ID_ASSOC = NOT_ASSOC_FK";
  
    $result = $conn->prepare($sql);
    $result->bindParam(':id', $id, PDO::PARAM_INT);
    $result->execute();

    $resultado = $result->fetch(PDO::FETCH_ASSOC);
    if(!is_array($resultado)){
    echo "Nunhum dado encontrado";
    exit;
    }

    $text = nl2br($resultado['TEXTO']);
    $result = str_replace( array("\r\n", "\r", "\n"), '<br />', $text ); 

    $date = $resultado['DATA_ED'];
    $data_publ= date_create($resultado['DATA']);
    
    $arquivo = $resultado['ARQUIVO'];
    $entry = base64_encode($arquivo);
    ?>
    <?php if ($date == null) {?>
      <div class="container">
    <div class="col-sm-12"> 
      <div> 
      
        <h1 class="titulo"><?php echo $resultado['TITULO']; ?></h1>
        <p class="text"><?php echo $resultado['SUBTITULO']; ?></p>
        <small><?php echo date_format($data_publ, 'd/m/Y H:i:s'); ?></small>
        <hr>
      </div>
      
      <div>
        <img src="data:image/jpeg;base64,<?= $entry ?>" class="img-responsive" alt="Image">
        <hr>
        <p class="text"><?php echo $result; ?></p>
      </div>
      
      <div class="panel-footer"><?php echo $resultado['NOME_FANTASIA']; ?></div>
    </div>


    <?php }else{ $date = date_create($resultado['DATA_ED']); ?>
  
  <div class="container">
    <div class="col-sm-12"> 
      <div> 
   		
      	<h1 class="titulo-not"><?php echo $resultado['TITULO']; ?></h1>
        <p class="text-not"><?php echo $resultado['SUBTITULO']; ?></p>
        <small><?php echo date_format($data_publ, 'd/m/Y H:i:s'); ?> - Atualizado em: <?php echo date_format($date, 'd/m/Y H:i:s'); ?></small>
   	    <hr>
      </div>
    	
    	<div>
    		<img src="data:image/jpeg;base64,<?= $entry ?>" class="img-responsive" style="width:100%;" alt="Image">
        <hr>
				<p class="text"><?php echo $result; ?></p>
    	</div>
			<div class="panel-footer"><?php echo $resultado['NOME_FANTASIA']; ?></div>
    </div>
  </div>
      
    <?php } ?>


    <!-- formulário comentário -->

  <?php 

  
    $id = isset($_GET['id']) ? (int) $_GET['id'] : null;
  
    if (empty($id)){
      echo "ID para alteração não definido";
    exit;
    }

  ?>
    <div class="container">
  
      <div><p>DEIXE AQUI SEU COMENTÁRIO</p></div>
<form action="add-comentario.php?id=<?=$id?>" method="post">
  <div class="form-row">
    <div class="form-group col-sm-7">
      <label>Nome</label>
      <input class="form-control" rows="2" id="nome" placeholder="Nome" name="nomeComent"></input>
    </div>
  </div>
            
  <div class="form-row">
    <div class="form-group col-sm-7">
      <label>Comentário</label>
      <textarea class="form-control" rows="2" id="comment" placeholder="Escreva um comentário..." name="coment"></textarea>
    </div>
  </div>

  <div class="form-row">
    <div class="form-group col-sm-12">
      <input type="hidden" name="acao" value="preenchido"/>
      <button class="btn" type="submit">COMENTAR</button>
    </div>

</form>
</div>
</div>
<div class="container">
<p>COMENTÁRIOS</p>
  <?php

    $query = "SELECT * FROM TB_COMENTARIO, TB_NOTICIAS WHERE TB_NOTICIAS.ID_NOT = TB_COMENTARIO.FK_ID_NOT AND ID_NOT='$id' ORDER BY COM_ID DESC LIMIT 6";
    $stmt = $conn->prepare($query);
    $res = $stmt->execute();
    $rows = $stmt->rowCount();
    if($rows <= 0){
      echo"<div>Seja o primeiro a comentar!</div>";

    } else {
      ?>

      <?php
      while($campos = $stmt->fetch(PDO::FETCH_ASSOC)){
           $id=$campos['COM_ID'];
           $name=$campos['COM_NOME'];
           $_comentario=$campos['COM_COMENTARIO'];
      ?>
           <div class="form-row" id="div-comentario">
              <div class="form-group col-sm-7">
                <p>NOME: <?php echo $name; ?></p>
                <p>COMENTÁRIO: <?php echo $_comentario; ?></p>
              </div>
            </div>
           <?php
        }
       }
       ?>

  </div>
</main>
</body>



</html>

<?php include "rodape.php";
?> 