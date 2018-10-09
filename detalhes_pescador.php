<!DOCTYPE html>
<html>
<head>
  <title>Detalhes Do Pescador</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
</head>
<body>
  <?php
  require 'cabeçalho.php';
  require_once 'bd/conexao.php';
  ?>
  <!-- Page Container -->
  <div class="w3-content w3-margin-top" style="max-width:1400px;margin-top:200%;">

    <!-- The Grid -->
    <div class="w3-row-padding">

      <!-- Left Column -->
      <div class="w3-third">

        <div class="w3-white w3-text-grey w3-card-4">
          <div class="w3-display-container" >
<!--               ----------------------------------------foto---------------------------------------------------------------
-->              
<body>
  <div class="container">
    <div class="row">

     <div class='caption'>
      <br>
      <br>
      <br>
      <br>
      <h1>Detalhes Do Pescador</h1>

      <div class="w3-container">
        <?php
        if (isset($_GET['id'])){
          $pescador_id = $_GET['id'];
        }

        $stmt = $conn->query("SELECT *
          FROM pescadores
          INNER JOIN estado_civil ON pescadores.id_estado = estado_civil.id_estado WHERE pescador_id ='$pescador_id'");

        $pescadores = $stmt->fetchAll();
        $stmt = $conn->prepare($sql);
        $res = $stmt->execute();
        $rows = $stmt->rowCount();
        foreach ($pescadores as $dados) {

          $pescador_id = $dados['pescador_id'];
          $matricula=$dados['matricula'];
          $nome=$dados['nome'];
          $cpf = $dados['cpf'];
          $endereco = $dados['endereco'];
          $bairro = $dados['bairro'];
          $estado = $dados['estado'];
          $cpf = $dados['cpf'];
          $titulo = $dados['titulo'];
          $profissional = $dados['profissional'];
          $pis = $dados['pis'];
          $rg = $dados['rg'];
          $orgao = $dados['orgao'];
          $nascimento = $dados['nascimento'];
          $rgp = $dados['rgp'];
          $nome_pai = $dados['nome_pai'];
          $nome_mae = $dados['nome_mae'];
          $dependete = $dados['dependente'];
          $data_ins = $dados['data_ins'];
          $insc_inss = $dados['insc_inss'];
          $arquivo = $dados['ARQUIVO'];

          $entry = base64_encode($arquivo);
          ?>

          <div class='col-sm-6 col-md-4'>

            <div class='thumbnail'>

              <img src="data:image/jpeg;base64,<?= $entry ?>" class="img-responsive" style="width:100%;height:400px;">            
            </div>
          </div>
          <br>
          <strong>matricula
          </strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $matricula</p>
          <strong>
          nome</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $nome</p>
          <strong>
          endereco</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $endereco</p>
          <strong>
          bairro</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $bairro</p>
          <strong>
          estado</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $estado</p>
          <strong>
          cpf</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $cpf</p>
          <strong>
          titulo</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $titulo</p>
          <strong>
          profissional</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $profissional</p>
          <strong>
          pis</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $pis</p>
          <strong>
          rg</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $rg</p>
          <strong>
          orgao</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $orgao</p>
          <strong>
          nascimento</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $nascimento</p>
          <strong>
          rgp</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $rgp</p>
          <strong>
          nome_pai</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $nome_pai</p>
          <strong>
          nome_mae</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $nome_mae</p>
          <strong>
          dependete</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $dependete</p>
          <strong>
          data_ins</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $data_ins</p>
          <strong>
          insc_inss</strong><p><i class='fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal'></i>
          $insc_inss</p>
          <?php
        }
        ?>
        <p class='w3-large'><b><i class='fa fa-asterisk fa-fw w3-margin-right w3-text-teal'></i>Resumo</b></p>
        <p>Apresentações</p>
        <div class='w3-light-grey w3-round-xlarge w3-small'>
          <div class='w3-container w3-center w3-round-xlarge w3-teal' style='width:90%'>90%</div>
        </div>
        <p class='w3-large w3-text-theme'><b><i class='fa fa-globe fa-fw w3-margin-right w3-text-teal'></i>Experiência</b></p>
        <p>Pesca</p>
        <div class='w3-light-grey w3-round-xlarge'>
          <div class='w3-round-xlarge w3-teal' style='height:24px;width:100%'></div>
        </div>
        <p>Vendas</p>
        <div class='w3-light-grey w3-round-xlarge'>
          <div class='w3-round-xlarge w3-teal' style='height:24px;width:55%'></div>
        </div>
        <p>Produtos</p>
        <div class='w3-light-grey w3-round-xlarge'>
          <div class='w3-round-xlarge w3-teal' style='height:24px;width:25%'></div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</div>
</div>

<div class="w3-twothird" style="max-width:1400px; margin-left: 35%;">

  <div class="w3-container w3-card w3-white w3-margin-bottom">
    <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Detalhes Do Pescador</h2>

    <div class="container">    
      <form method="post">
        <div class="form-group">
          <label for="comment">Descrição:</label>
          <textarea class="form-control" rows="5" id="comment" style="width: 50%;"></textarea>
        </div>
        <a  target='_blank' href="index.php" data-placement="top" title="Enviar"><i class="fa fa-check-circle fa-1x"></i></a>

        <a  target='_blank' href="index.php" data-placement="top" title="Editar"><i class="fa fa-edit fa-1x"></i></a>
      </form>
    </div>


    <div class="w3-container">
      <h5 class="w3-opacity"><b>Em definição</b></h5>
      <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jan 2015 - <span class="w3-tag w3-teal w3-round">Current</span></h6>
      <p>Lorem ipsum dolor sit amet. Praesentium magnam consectetur vel in deserunt aspernatur est reprehenderit sunt hic. Nulla tempora soluta ea et odio, unde doloremque repellendus iure, iste.</p>
      <hr>
    </div>
    <div class="w3-container">
      <h5 class="w3-opacity"><b>Em definição</b></h5>
      <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Mar 2012 - Dec 2014</h6>
      <p>Consectetur adipisicing elit. Praesentium magnam consectetur vel in deserunt aspernatur est reprehenderit sunt hic. Nulla tempora soluta ea et odio, unde doloremque repellendus iure, iste.</p>
      <hr>
    </div>
    <div class="w3-container">
      <h5 class="w3-opacity"><b>Em definição</b></h5>
      <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jun 2010 - Mar 2012</h6>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p><br>
    </div>
  </div>

</div>
</div>
</div>
</div>

<?php include 'rodape.php'; ?>
</body>
</html>