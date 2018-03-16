<?php
session_start();
require_once("../Biblioteca/biblioteca.php");//Lama a la biblioteca
if(isset($_SESSION["cuenta"],$_POST["reporteTipo"],$_POST["usuarioR"])){
  if($_SESSION["cuenta"]!=""){
  $mensaje = reportarUsuario($_SESSION["cuenta"],$_POST["usuarioR"],$_POST["reporteTipo"],$_POST["razon"]);
    $_SESSION["mensaje"]=$mensaje;
    header('location:../../Perfil.php?id='.$_POST["usuarioR"]);
  }else{
     header('location:../../Perfil.php?id='.$_POST["usuarioR"]);
     $_SESSION["mensaje"]="Inicia sesion para reportar";
  }
}
else{
   header('location:../../index.php');
}
 ?>
