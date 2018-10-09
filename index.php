<?php
require_once "cabeçalho.php";
?>
<!-- Page Content -->
<div class="container">

 <?php
 require_once "cabeçalho.php";
 ?>
 <!-- Page Content -->
 <div class="container">
  <div class="col-md-8">
    <br>
    <br>
    <br>
    <br>
    <h2 class="card-title">Últimas Notícias</h2>
  </h1>


  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block w-100" src="img/20.jpeg" class="img-responsive" style="width:100%;height:400px";>
      </div>

      <div class="row">

        <?php
        $sql = "SELECT ARQUIVO, TITULO, ID_NOT FROM TB_NOTICIAS WHERE PUBLICADO = '1' ORDER BY DATA DESC LIMIT 3";

        $stmt = $conn->prepare($sql);
        $res = $stmt->execute();
        $rows = $stmt->rowCount();

        if ($rows <=0) {
          echo "<h1>NÃO EXISTE NOTICIAS PLUBLICADAS :(</h1>";
        } else{         

          ?>
          <?php 

          while ($campos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $id = $campos['ID_NOT'];
            $titulo = $campos['TITULO'];
            $arquivo = $campos['ARQUIVO'];
            $entry = base64_encode($arquivo);

            ?>
            <div class="carousel-item">
              <a href="not.php?id=<?=$id?>"><img src="data:image/jpeg;base64,<?= $entry ?>" class="img-responsive" style="width:100%;height:400px;"></a>
              <h3 style="font-size: 25px margin-right:0;"><?php echo $titulo ?></h3>            
            </div>       

            <?php
          }
        }
        ?>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      <br>
      <br>
      <?php
      $sql = "SELECT ARQUIVO, TITULO, TEXTO, ID_NOT, SUBTITULO FROM TB_NOTICIAS WHERE PUBLICADO = '1' ORDER BY DATA DESC LIMIT 6";

      $stmt = $conn->prepare($sql);
      $res = $stmt->execute();
      $rows = $stmt->rowCount();

      if ($rows <=0) {
        echo "<h1>NÃO EXISTE NOTICIAS PLUBLICADAS :(</h1>";
      } else{         

        ?>
        <div class="row">
          <?php 
          while ($campos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $id = $campos['ID_NOT'];
            $titulo = $campos['TITULO'];
            $arquivo = $campos['ARQUIVO'];
            $texto = $campos['TEXTO'];
            $subtitulo = $campos['SUBTITULO'];

            $rest = substr($texto, 0, 300);

            $entry = base64_encode($arquivo);

            ?>


            <!-- <div class="not"> -->
              <div class="col-md-4">
                <div>
                  <h4 class="titulo-h4"><?php echo $titulo ?></h4>
                  <p class="text-index"><?php echo $subtitulo ?></p>
                </div>
                <div>
                  <a href="not.php?id=<?=$id?>"><img src="data:image/jpeg;base64,<?= $entry ?>" class="img-responsive" style="width:100%;height:200px;" alt="Image"></a>
                  <p class="text-index"><?php echo $rest ?><a href="not.php?id=<?=$id?>"> Saiba mais...</a></p>
                  <hr>
                </div>
              </div>

              <!-- </div> -->
              <?php
            }
            echo "</div>";
          }
          ?>

        </div>














        <div class="">
          <div class="card-body">
            <h2 class="card-title">Sobre a Colônia</h2>
            <p class="card-text">Colonia de Pescadores Z-10 é uma empresa de associações cívicas e sociais localizada no Estado de
              Pernambuco. A organização encontra-se na Rua Dr Jose Goncalves S/N. Esta empresa de capital privado
              foi fundada no ano de 1984 (30 anos atrás). Colonia de Pescadores Z-10 encontra-se em funcionamento
              há mais de 17 anos que a expectativa média de vida para uma empresa no Brasil, e há mais de 12 anos
            que a expectativa média de vida para uma empresa desse ramo de atividade.</p>
            <a href="#" class="btn btn-primary">Veja mais &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            Posted on January 1, 2017 by
            <a href="#">Start Bootstrap</a>
          </div>
        </div>

        <!-- Blog Post -->
        <div class="fo">
          <img class="foto" src="img/1.jpeg" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">A Pesca No Litoral Norte</h2>
            <p class="card-text">Apesar da modesta participação da Região Nordeste e do Estado de Pernambuco na produção pesqueira nacional
              – 11,7% e 0,5%, respectivamente, no período de 1980-1994 (Paiva, 1997, p.29) – a pesca desempenha importante
              papel na sobrevivência das comunidades do Litoral e Zona da Mata Pernambucana.
              O sistema de pesca predominante no Litoral de Pernambuco é o artesanal que, no ano de 1998, respondeu por
              99,0% da produção total de pescado (estuarino e marítimo) do Estado (IBAMA, 1999). A maior parte dessa
              produção provém do Litoral Norte, onde existem várias comunidades pesqueiras. À exceção de Itamaracá e
              Ponta de Pedras onde a pesca marítima ou no mar de fora é a mais expressiva, nas demais comunidades predomina
            a pesca em rios, estuários e águas litorâneas ou no mar de dentro (Silva e Carvalho, 1996, p. 19).</p>
            <a href="#" class="btn btn-primary">Veja Mais &rarr;</a>
          </div>
          <div class="card-footer text-muted">

          </div>
        </div>

          <!-- Blog Post 
          <div class="card mb-4">
            <img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap">
            <div class="card-body">
              <h2 class="card-title">Post Title</h2>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
              <a href="#" class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on January 1, 2017 by
              <a href="#">Start Bootstrap</a>
            </div>
          </div>
          <!-- Pagination -->
          <ul class="pagination justify-content-center mb-4">
            <li class="page-item">
              <a class="page-link" href="#">&larr; Anterior</a>
            </li>
            <li class="page-item ">
              <a class="page-link" href="#">Próxima &rarr;</a>
            </li>
          </ul>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- Categories Widget -->
          <br>
          <br>
          <br>
          <div class="card my-4">
            <button class="btn btn-blue">Institucional</button>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">História</a>
                    </li>
                    <li>
                      <a href="#">Infraestrutura</a>
                    </li>
                    <li>
                      <a href="#">Nossa equipe</a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Diretoria Atual</a>
                    </li>
                    <li>
                      <a href="#">Regimento</a>
                    </li>
                    <li>
                      <a href="#">Estatuto</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Side Widget -->

          <div class="card my-4">
            <button class="btn btn-blue">Área Restrita</button>
            <div class="card-body">
              <?php if($_SESSION['logado'] == True): ?>
                <li><a href="cadastro_pescadores.php">Cadastre Um Novo Pescador</a></li>
                <li><a href="armazenamento.php">Listar Todos Pescadores</a></li>
                <li><a href="escrever-noticias.php">Cadastre Uma Nova Noticia</a></li>
                <li><a href="index-assoc.php">Listar Todas As Noticias</a></li>
              <?php endif ?>
            </ul>
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
</div>
  <!-- /.container -->

  <!-- Footer -->
  <?php
  require_once "rodape.php"
  ?>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>