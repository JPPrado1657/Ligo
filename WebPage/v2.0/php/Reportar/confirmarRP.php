<?php
session_start();
require_once("../Biblioteca/biblioteca.php");//Lama a la biblioteca

if(isset($_SESSION["cuenta"],$_POST["reporteTipo"],$_SESSION["productoIDR"])){
  if($_SESSION["cuenta"]!=""){
  $mensaje = reportarProducto($_SESSION["cuenta"],$_POST["reporteTipo"],$_POST["razon"],$_SESSION["productoIDR"]);
    $_SESSION["mensaje"]=$mensaje;
    unset($_SESSION["productoIDR"]);
    header('location:../../productos.php');
  }else{
    header('location:../../productos.php');
     $_SESSION["mensaje"]="Inicia sesion para reportar";
  }
}
else{
  header('location:../../productos.php');
}
 ?>
