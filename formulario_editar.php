<?php
include 'cabeçalho.php';
require_once 'bd/conexao.php';
// pega o ID da URL
$id = isset($_GET['id']) ? (int) $_GET['id'] : null;
    //Valida a variavel da URL
if (empty($id)){
  echo "ID para alteração não definido";
  exit;
}

$stmt = "SELECT pescador_id,  matricula, nome, endereco, bairro, estado, cpf, titulo, profissional, pis, nascimento, rgp, nome_pai, nome_mae, dependente, data_ins, insc_inss, rg, orgao, id_estado, ARQUIVO FROM pescadores WHERE pescador_id='$id'";
$stmt = $conn->prepare($stmt);
$stmt->bindParam(':id', $id, PDO::PARAM_INT);
$stmt->execute();
$resultado_msg_contato = $stmt->fetch(PDO::FETCH_ASSOC);

if(!is_array($resultado_msg_contato)){
  echo "Nunhum contato encontrado";
  exit;
}
$arquivo = $resultado_msg_contato['ARQUIVO'];
$entry = base64_encode($arquivo);

?>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Editar</title>
  <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="js/jquery.mask.min.js"></script>
  <script type="text/javascript">

    $(document).ready(function(){  
      $("#data").mask("99/99/9999");
      $("#data1").mask("99/99/9999");
      $("#telefone").mask("(99) 9999-9999");
      $("#indicativoTelefone").mask("+55 (99) 9999 999");
      $("#rg").mask("9.999.999");
      $("#cpf").mask("999.999.999-99");
      $("#titulo").mask("9999.9999.9999");
      $("#profissional").mask("999.999.999-99");
      $("#pis").mask("999.99999.99-9");
      $("#inss").mask("99.999.99999/99");
    });
  </script>
  <style>
  *{ margin:0; padding:0;}

  body{ font:100% normal Arial, Helvetica, sans-serif; background:#ccc;}

  form,input,textarea{margin:0; padding:0; color:black;}

  select{
    width: 300px;
    height: 35px;
    margin-left: 20px;
    margin-top:20px;
    padding-left: 10px;
    font-size: 1.1em;
    outline: none;
    background-color: #dcdcdc;
    border-radius: 5px;

  }
  div.ola {
    margin:0 auto;
    width:100%;
    background:#fff;
    position:relative;
    top:50px;
  }

  div.ola h1 { 
    color:black;
    font-size: 2.5em;
    text-transform:uppercase;
    padding:5px 0 5px 5px; 
    margin-top:50px;

  }

  div.ola label {
    width:100%;
    display: block;
    background:#fff;
    padding:10px 0 10px 0;
    font-size: 1.5em;

  }

  div.ola .input_text {
    padding:10px 10px;
    width:200px;
    background:#262626;
    border-bottom: 1px double #171717;
    border-top: 1px double #171717;
    border-left:1px double #333333;
    border-right:1px double #333333;
  }

  div.ola .message{
    padding:7px 7px;
    width:350px;
    background:#262626;
    border-bottom: 1px double #171717;
    border-top: 1px double #171717;
    border-left:1px double #333333;
    border-right:1px double #333333;
    overflow:hidden;
    height:150px;
  }

  div.ola .button{
    margin:0 0 10px 0;
    padding:4px 7px;
    background:#660000;
    border:0px;
    position: relative;
    top:10px;
    left:382px;
    width:100px;
    border-bottom: 1px double #660000;
    border-top: 1px double #660000;
    border-left:1px double #FF0033;
    border-right:1px double #FF0033;
  }


</style>
</head>
<body>
  <h1>Editar</h1>
  <form action="editar.php?id=<?php echo $id; ?>" method="POST">
   <div class="ola">
     <h1> Dados Pessoais Dos Pescadores</h1>

     <div class="form-row">
      <div class="form-group col-md-12">
        <label>Selecione outro arquivo</label>
        <input type="file"  class="form-control-file" name="file" id="imgInp" value="<?php echo $resultado_msg_contato['ARQUIVO']; ?>">
        <br>
        <img id='img-upload' src="data:image/jpeg;base64,<?= $entry ?>"/>
      </div>
    </div>

    <label>CADASTRO MAT. N</label>
    <input type="text" name="matricula"  value="<?php echo $resultado_msg_contato['matricula']; ?>" >
  </br>
  <label>Nome</label>
  <input type="text" name="nome" placeholder="Digite Seu Nome Completo"  value="<?php echo $resultado_msg_contato['nome']; ?>" >
  <label>Endereço</label>
  <input type="text"  name="endereco" placeholder="Digite Seu endereço"  value="<?php echo $resultado_msg_contato['endereco']; ?>" >

  <label>Bairro</label>
  <input type="text"  name="bairro" placeholder="Digite Seu Bairro"  value="<?php echo $resultado_msg_contato['bairro']; ?>" >
  <label>Estado</label>
  <input type="text"  name="estado" placeholder="Digite Seu Bairro"  value="<?php echo $resultado_msg_contato['estado']; ?>" >

  <label>CPF</label>
  <input type="text"  name="cpf" placeholder="Digite Seu CPF"  value="<?php echo $resultado_msg_contato['cpf']; ?>" >

  <label>Titulo</label>
  <input type="text"  name="titulo" placeholder="Digite Seu Titulo" value="<?php echo $resultado_msg_contato['titulo']; ?>" >
  <label>Profissional</label>
  <input type="text"  name="profissional" placeholder="Digite Seu Profissional" value="<?php echo $resultado_msg_contato['profissional']; ?>" >

  <label>PIS</label>
  <input type="text"  name="pis" placeholder="Digite Seu Pis" value="<?php echo $resultado_msg_contato['pis']; ?>" >
  <label>Estado Civil</label>
  <select name="estado_civil"  >
    <?php
    include 'bd/conexao.php';
    $sql = "SELECT * FROM estado_civil";
    foreach ($conn->query($sql) as $registro) {
      $id_estado = $registro['id_estado'];
      $nome = $registro['nome_est'];
      echo "<option value='".$id_estado."'>".$nome."</option>";
    }
    ?>
  </select>
  <label>Nome Do Pai</label>
  <input type="text"  name="nome_pai" placeholder="Digite o nome do pai"  value="<?php echo $resultado_msg_contato['nome_pai']; ?>" >
  <label>Nome Da Mãe</label>
  <input type="text" name="nome_mae" placeholder="Digite o nome da mae"  value="<?php echo $resultado_msg_contato['nome_mae']; ?>" >
  <label>Nome Do Filho</label>
  <input type="text" name="dependente" placeholder="Digite Seu Dependente" value="<?php echo $resultado_msg_contato['dependente']; ?>" >
  <h1>Dados Profissionais Dos Pescadores</h1>
  <label>Data De Nascimento</label>
  <input type="date" name="nascimento" placeholder="Digite Sua Data de nascimento" value="<?php echo $resultado_msg_contato['nascimento']; ?>" ></br>
  <label>Órgão Exp</label>
  <input type="text" name="orgao" placeholder="Digite seu Órgão Expedidor" value="<?php echo $resultado_msg_contato['orgao']; ?>" ></br>
  <label>RGP</label>
  <input type="text" name="rgp" placeholder="Digite Seu RGP" value="<?php echo $resultado_msg_contato['rgp']; ?>" >
  <label>Data Da Inscrição</label>
  <input type="date" name="data_ins" placeholder="Digite a Data de Inscricão" value="<?php echo $resultado_msg_contato['data_ins']; ?>" ></br>
  <label>Inscrição do INSS</label>
  <input type="text"  name="insc_inss" placeholder="Digite a Inscrição do INSS" value="<?php echo $resultado_msg_contato['insc_inss']; ?>" >
  <label>Inscrição do RG</label>
  <input type="text" name="rg" placeholder="Digite Seu RG" value="<?php echo $resultado_msg_contato['rg']; ?>" >
  <input type="submit" name="enviar" value="Salvar Cadastro">

</form>
</div>
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
<?php
require_once 'rodape.php';
?> 
</body>
</html>