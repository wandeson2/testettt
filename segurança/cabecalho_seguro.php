<script type="text/javascript">
    function loginfailed(){
        window.location='sistema_de_login/login.php';
    }
    </script>
<?php
include '../bd/conexao.php';
if($_SESSION['logado'] == false){
    echo "<script>loginfailed()</script>";
}
?>