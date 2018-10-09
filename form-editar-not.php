<?php
session_start();
include 'bd/conexao.php';
include 'cabeçalho.php';
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

    $sql = "SELECT CATEGORIA, TITULO, SUBTITULO, ARQUIVO, TEXTO, PUBLICADO FROM pescadores WHERE ID_NOT='$id'";
    $result = $conn->prepare($sql);
    $result->bindParam(':id', $id, PDO::PARAM_INT);
    $result->execute();

    $resultado = $result->fetch(PDO::FETCH_ASSOC);
    if(!is_array($resultado)){
    echo "Nunhum dado encontrado";
    exit;
    }
    $publicado = $resultado['PUBLICADO'];
    $arquivo = $resultado['ARQUIVO'];
    $entry = base64_encode($arquivo);

?>
<?php 

  if ($publicado == 1) {?>
  
    <div class="container">
      
      
      
      <form action="editar-noticias.php?id=<?=$id?>" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?=$id?>">

        <div class="form-row">
          <div class="form-group col-md-12">
            <h2>Edite sua notícia</h2>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Selecione outro arquivo</label>
            <input type="file"  class="form-control-file" name="file" id="imgInp">
            <br>
            <img id='img-upload' src="data:image/jpeg;base64,<?= $entry ?>"/>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite o Título da notícia</label>
            <input type="text" class="form-control" name="titulo" required value="<?php echo $resultado['TITULO']; ?>">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite o subtítulo da notícia</label>
            <input type="text" class="form-control" name="subtitulo"  value="<?php echo $resultado['SUBTITULO']; ?>">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite a notícia</label>
            <textarea rows="10" cols="10" name="texto" class="form-control" required=""><?php echo $resultado['TEXTO']; ?></textarea>
          </div>
        </div> 

        <div class="form-row">
          <div class="form-group col-md-12">
            <label for="sel2">Categoria da notícia</label>
            <p><?php echo $resultado['CATEGORIA']; ?></p>
            <label for="sel2">Editar categoria</label>
            <select multiple class="form-control" id="sel2" name="categoria" required="">
              <option value="Cursos">Cursos</option>
              <option value="Reuniões">Reuniões</option>
              <option value="Esporte">Esporte</option>
              <option value="Projetos">Projetos</option>
              <option value="Ações Sociais">Ações Sociais</option>
            </select>
          </div>
        </div> 

        <input type="hidden" name="publicado" value=<?php echo $publicado ?>>

        <input type="hidden" name="data_ed">
        <!-- <div class="form-row">
          <div class="form-group col-md-12">
            <label>Data de edição</label>
            <input type="data" class="form-control" name="subtitulo"  value="">
          </div>
        </div> -->



<!--         <div class="form-row">
          <div class="form-group col-md-12">
            <div class="checkbox">
              <p style="color:red;">Selecione publicar se deseja que sua notícia seja publicada agora.</p>
              <label><input type="checkbox" name="publicado" value="0">Publicar</label>
            </div>
          </div>
        </div> -->
      
        <div class="form-row">
          <div class="form-group col-md-12">
            <a href="index-assoc.php" id="btn" class="btn"><i class="fas fa-caret-left"></i> Voltar</a>
            <button id="btn" class="btn">Editar</button>
          </div>
        </div> 
      </form>
    
    <div>
<?php }else{?> 
<div class="container">
      
      
      
      <form action="editar-noticias.php?id=<?=$id?>" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<?=$id?>">

        <div class="form-row">
          <div class="form-group col-md-12">
            <h2>Edite sua notícia</h2>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Selecione outro arquivo</label>
            <input type="file"  class="form-control-file" name="file" id="imgInp">
            <br>
            <img id='img-upload' src="data:image/jpeg;base64,<?= $entry ?>"/>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite o Título da nóticia</label>
            <input type="text" class="form-control" name="titulo" required value="<?php echo $resultado['TITULO']; ?>">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite o sub título da nóticia</label>
            <input type="text" class="form-control" name="subtitulo"  value="<?php echo $resultado['SUBTITULO']; ?>">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite a Nóticia</label>
            <textarea rows="10" cols="10" name="texto" class="form-control" required=""><?php echo $resultado['TEXTO']; ?></textarea>
          </div>
        </div> 

        <div class="form-row">
          <div class="form-group col-md-12">
            <label for="sel2">Categoria da nóticia</label>
            <p><?php echo $resultado['CATEGORIA']; ?></p>
            <label for="sel2">Editar categoria</label>
            <select multiple class="form-control" id="sel2" name="categoria">
              <option value="Cursos">Cursos</option>
              <option value="Reuniões">Reuniões</option>
              <option value="Esporte">Esporte</option>
              <option value="Projetos">Projetos</option>
              <option value="Ações Sociais">Ações Sociais</option>
            </select>
          </div>
        </div> 

        <div class="form-row">
          <div class="form-group col-md-12">
            <div class="checkbox">
              <p style="color:red;">Selecione publicar se deseja que sua notícia seja publicada agora.</p>
              <label><input type="checkbox" name="publicado" value="0">Publicar</label>
            </div>
          </div>
        </div>

        <input type="hidden" name="data_ed">

        <!-- <div class="form-row">
          <div class="form-group col-md-3">
            <label>Data de edição</label>
            <input type="data" class="form-control" name="data_ed"  value="" placeholder="00/00/0000">
          </div>
        </div> -->
      
        <div class="form-row">
          <div class="form-group col-md-12">
            <a href="index-assoc.php" id="btn" class="btn"><i class="fas fa-caret-left"></i> Voltar</a>
            <button id="btn" class="btn">Editar</button>
          </div>
        </div> 
      </form>
    
    <div>
    <?php } ?>
  </main>
<br><br>
<?php
include 'rodape.php';
?>
<script type="text/javascript" >
    $(document).ready( function() {
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $('#img-upload').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
        }
      }
      $("#imgInp").change(function(){
        readURL(this);
      });   
    });

  </script>

</body>
</html>