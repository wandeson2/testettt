<?php
include "cabeçalho.php";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
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
  <form action="bd/cadastrar_pescadores.php" method="POST" enctype="multipart/form-data">
   <div class="ola">  
     <h1>Dados Pessoais Dos Pescadores</h1>
    <label>Foto</label>
     <div class="form-row">
      <div class="form-group col-md-12">
        <input type="file"  class="form-control-file" name="file" id="imgInp">
        <br>
        <img id='img-upload'/>
      </div>
    </div>

    <label>CADASTRO MAT. N</label>
    <input type="number" name="matricula" placeholder="Digite o Numero Da Matricula">

    <label>Nome</label>
    <input type="text" name="nome" placeholder="Digite Seu Nome Completo" required>
    <label>Endereço</label>
    <input type="text"  name="endereco" placeholder="Digite Seu endereço" required>

    <label>Bairro</label>
    <input type="text"  name="bairro" placeholder="Digite Seu Bairro" required>
    <label>estado</label>
    <input type="text"  name="estado" placeholder="Digite Seu Bairro" required>

    <label>CPF</label>
    <input id="cpf" type="text" name="cpf" placeholder="Digite Seu CPF" required>

    <label>Titulo</label>
    <input type="text" id="titulo"  name="titulo" placeholder="Digite Seu Titulo">
    <label>Profissional</label>
    <input type="number"  name="profissional" placeholder="Digite Seu Profissional">

    <label>PIS</label>
    <input type="text" id="pis"  name="pis" placeholder="Digite Seu Pis">
    <label>Estado Civil</label>
    <select name="estado_civil" required>
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
    <input type="text"  name="nome_pai" placeholder="Digite o nome do pai" required>
    <label>Nome Da Mãe</label>
    <input type="text" name="nome_mae" placeholder="Digite o nome da mae" required>
    <label>Nome Do Filho</label>
    <input type="text" name="dependente" placeholder="Digite Seu Dependente"required>
    <h1>Dados Profissionais Dos Pescadores</h1>
    <label>Data De Nascimento</label>
    <input type="date" name="nascimento"  placeholder="Digite Sua Data de nascimento"required>
    <label>Órgão Exp</label>
    <input type="text" name="orgao" placeholder="Digite seu Órgão Expedidor"required>
    <label>RGP</label>
    <input type="number" name="rgp" placeholder="Digite Seu RGP"required>
    <label>Data Da Inscrição</label>
    <input type="date" name="data_ins" placeholder="Digite a Data derequired Inscricão"required>
    <label>Inscrição do INSS</label>
    <input type="text" id="inss" name="insc_inss" placeholder="Digite a Inscrição dorequired INSS"required>
    <label>RG</label>
    <input type="text" id="rg" name="rg" placeholder="Digite Seu RG"required>
    <label>Assinatura Do Socio</label>
    <input type="text" name="assinatura_socio">
    <label>Assinatura Do Presidente</label>
    <input type="text" name="assinatura_presidente">

    <input type="submit" name="enviar" value="Salvar Cadastro">

  </form>
</div>
<?php
include "rodape.php"
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