<?php include_once 'cabeçalho.php' ?>
<br>
<br>
<br>
<br>
<br>
  <main>
   
    <div class="container">
      
      <form action="addNoticias.php" method="POST" enctype="multipart/form-data">
        
        <div class="form-row">
          <div class="form-group col-md-12">
            <h2>Escrever Notícias</h2>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group col-md-12">
            <input type="file"  class="form-control-file" name="file" id="imgInp">
            <br>
            <!-- <input type="text" class="form-control" readonly> -->
            <img id='img-upload'/>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite o Título da notícia</label>
            <input type="text" class="form-control" name="titulo" required>
          </div>
        </div>
      
        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite o subtítulo da notícia</label>
            <input type="text" class="form-control" name="subtitulo">
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-12">
            <label>Digite a notícia</label>
            <textarea rows="10" cols="10" name="texto" class="form-control" required></textarea>
          </div>
        </div> 

        <div class="form-row">
          <div class="form-group col-md-12">
            <label for="sel2">Classifique a notícia</label>
            <select multiple class="form-control" id="sel2" name="categoria" required>
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
        
        <div class="form-row">
          <div class="form-group col-md-12">
            <button id="btn" class="btn">Salvar</button>
          </div>
        </div> 
      </form>
    <div>
  
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
<!-- maxlength="400" -->