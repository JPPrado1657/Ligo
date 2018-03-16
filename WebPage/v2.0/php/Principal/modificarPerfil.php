<?php
session_start();//Inicai la sesion
require_once("../Biblioteca/biblioteca.php");//Llama a las librerias
if(isset($_POST["Nombre"])){//Confirma que los valores hayan sido introducidos
  if(isset($_POST["Apellido_P"])){
    if(isset($_POST["Apellido_M"])){
      $Nombre = $_POST["Nombre"];
      $Apellido_P = $_POST["Apellido_P"];
      $Apellido_M = $_POST["Apellido_M"];
      actualizarDatos($_SESSION["cuenta"],$Nombre,$Apellido_P,$Apellido_M);//Ejecuta la funcion de la biblioteca para la modificacion del perfil
      echo 'Se han modificado los datos';//Mensaje de respuesta
    }
  }
}



 ?>
