<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
  <?php include "cabecalho.php";?>

<script>
    function validar(dom,tipo){
	    switch(tipo){
        	case'num':var regex=/[A-Za-z]/g;break;
        	case'text':var regex=/\d/g;break;
	    }
	    dom.value=dom.value.replace(regex,'');
    }
</script>

<div class="container" id="corpo">

  <h2 class="pagm">Cadastro de Músicos</h2>
    <form class="form-horizontal" action="cad-musico.php" method="POST">
      <div class="form-group" id="pri">
        <label class="control-label col-sm-2" for="name">Nome:</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="name" placeholder="Nome artístico ou da Banda" name="name" onkeyup="validar(this,'text');" required>
        </div>
      </div>
      
      <div class="form-group" id="sec">
        <label class="control-label col-sm-2" for="email">E-mail:</label>
        <div class="col-sm-10">          
          <input type="text" class="form-control" id="email" placeholder="E-mail" name="email" required>
        </div>
      </div>

      <div class="form-group" id="ter">
        <label class="control-label col-sm-2" for="pwd">Senha:</label>
        <div class="col-sm-10">          
          <input type="password" class="form-control" id="pwd" placeholder="Defina sua senha" name="pwd" required>
        </div>
      </div>

      <div class="form-group" id="qua">
        <label class="control-label col-sm-2" for="cpf">CPF:</label>
        <div class="col-sm-10">          
          <input type="text" class="form-control" id="cpf" placeholder="CPF (apenas números)" name="cpf" onkeyup="validar(this,'num');" maxlength="11" required>
          <script>
                function funcao1(){alert("Usamos seu CPF para confirmarmos que você é de fato uma pessoa física.");}
            </script>
                
            <input type="button" onclick="funcao1()" id="duvida" value="?" />
        </div>
      </div>

      <div class="form-group" id="qui">
        <label class="control-label col-sm-2" for="cel">Telefone:</label>
        <div class="col-sm-10">          
          <input type="text" class="form-control" id="cel" placeholder="Telefone (apenas números)" name="cel" onkeyup="validar(this,'num');" maxlength="13" required>
        </div>
      </div> 
      
      <div class="form-group">
        <label class="control-label col-sm-2" for="born" id="sex">Data de Nascimento:</label>
        <div class="col-sm-10" id="born">          
          <select name="dia">
            <option value="0">Dia</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="28">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
          </select>

          <select name="mes">
            <option value="0">Mês</option>
            <option value="01">Janeiro</option>
            <option value="02">Fevereiro</option>
            <option value="03">Março</option>
            <option value="04">Abril</option>
            <option value="05">Maio</option>
            <option value="06">Junho</option>
            <option value="07">Julho</option>
            <option value="08">Agosto</option>
            <option value="09">Setembro</option>
            <option value="10">Outubro</option>
            <option value="11">Novembro</option>
            <option value="12">Dezembro</option>
          </select>

          <select name="ano">
            <option value="0">Ano</option>
            <option value="2018">2018</option>
            <option value="2017">2017</option>
            <option value="2016">2016</option>
            <option value="2015">2015</option>
            <option value="2014">2014</option>
            <option value="2013">2013</option>
            <option value="2012">2012</option>
            <option value="2011">2011</option>
            <option value="2010">2010</option>
            <option value="2009">2009</option>
            <option value="2008">2008</option>
            <option value="2007">2007</option>
            <option value="2006">2006</option>
            <option value="2005">2005</option>
            <option value="2004">2004</option>
            <option value="2003">2003</option>
            <option value="2002">2002</option>
            <option value="2001">2001</option> 
            <option value="2000">2000</option>
            <option value="1999">1999</option>
            <option value="1998">1998</option>
            <option value="1997">1997</option>
            <option value="1996">1996</option>
            <option value="1995">1995</option>
            <option value="1994">1994</option>
            <option value="1993">1993</option>
            <option value="1992">1992</option>
            <option value="1991">1991</option>
            <option value="1990">1990</option>
            <option value="1989">1989</option>
            <option value="1987">1987</option>
            <option value="1986">1986</option>
            <option value="1985">1985</option>
            <option value="1984">1984</option>
            <option value="1983">1983</option>
            <option value="1982">1982</option>
            <option value="1981">1981</option>
            <option value="1980">1980</option>
            <option value="1979">1979</option>
            <option value="1978">1978</option>
            <option value="1977">1977</option>
            <option value="1976">1976</option>
            <option value="1975">1975</option>
            <option value="1974">1974</option>
            <option value="1973">1973</option>
            <option value="1972">1972</option>
            <option value="1971">1971</option>
            <option value="1970">1970</option>
            <option value="1969">1969</option>
            <option value="1968">1968</option>
            <option value="1967">1967</option>
            <option value="1966">1966</option>
            <option value="1965">1965</option>
            <option value="1964">1964</option>
            <option value="1963">1963</option>
            <option value="1962">1962</option>
            <option value="1961">1961</option>
            <option value="1960">1960</option>
            <option value="1959">1959</option>
            <option value="1958">1958</option>
            <option value="1957">1957</option>
            <option value="1956">1956</option>
            <option value="1955">1955</option>
            <option value="1954">1954</option>
            <option value="1953">1953</option>
            <option value="1952">1952</option>
            <option value="1951">1951</option>
            <option value="1950">1950</option>
            <option value="1949">1949</option>
            <option value="1948">1948</option>
            <option value="1947">1947</option>
            <option value="1946">1946</option>
            <option value="1945">1945</option>
            <option value="1944">1944</option>
            <option value="1943">1943</option>
            <option value="1942">1942</option>
            <option value="1941">1941</option>
            <option value="1940">1940</option>
            <option value="1939">1939</option>
            <option value="1938">1938</option>
            <option value="1937">1937</option>
            <option value="1936">1936</option>
            <option value="1935">1935</option>
            <option value="1934">1934</option>
            <option value="1933">1933</option>
            <option value="1932">1932</option>
            <option value="1931">1931</option>
            <option value="1930">1930</option>
            <option value="1929">1929</option>
            <option value="1928">1928</option>
            <option value="1927">1927</option>
            <option value="1926">1926</option>
            <option value="1925">1925</option>
            <option value="1924">1924</option>
            <option value="1923">1923</option>
            <option value="1922">1922</option>
            <option value="1921">1921</option>
            <option value="1920">1920</option>
          </select>
        </div>
      </div>

      <script>
                function funcao2(){alert("Usamos sua data de nascimento para melhorar seu relacionamento com a plataforma.");}
            </script>
                
            <input type="button" onclick="funcao2()" id="duvidaborn" value="?" />

      <div class="form-group" id="set">
        <label class="control-label col-sm-2" for="address">Endereço:</label>
        <div class="col-sm-10">          
          <input type="text" class="form-control" id="address" placeholder="Endereço" name="address" required>
        </div>
      </div>     
      
      <div class="form-group" id="oito">
        <label class="control-label col-sm-2" for="gen">Gênero Musical:</label>
        <div class="col-sm-10" id="gen">          
          <select class="selectpicker" name="gen">
            <option value="">Gênero</option>           
            <option>Eletrônico</option>
            <option>Hip Hop</option>
            <option>MPB</option>
            <option>Pop</option>
            <option>Pop Rock</option>
            <option>Rap</option>
            <option>Reggae</option>
            <option>Rock</option>
            <option>Sertanejo</option>
          </select>        
        </div>
      </div>

      <script>
                function funcao3(){alert("Escolha um gênero musical principal para se apresentar quando for contratado.");}
            </script>
                
            <input type="button" onclick="funcao3()" id="duvidagenero" value="?" />

      <div class="form-group">        
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-default" id="btcad">Cadastrar</button>
        </div>
      </div>
    </form>
</div>

<hr>

<?php 
include 'rodape.php';
?>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="js/jquery-2.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
  <script src="js/wow.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.isotope.min.js"></script>
  <script src="js/jquery.bxslider.min.js"></script>
  <script type="text/javascript" src="js/fliplightbox.min.js"></script>
  <script src="js/functions.js"></script>
  <script type="text/javascript">
    $('.portfolio').flipLightBox()
  </script>
 </body>
</html>
