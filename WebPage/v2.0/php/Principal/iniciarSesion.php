<?php
session_start();//Inicia la sesion
require_once("../Biblioteca/biblioteca.php");//Recobra las librerias

$datos = iniciarSesion($_POST["Nombre_Usuario"]);//Obtiene los datos del usuario por medio de la funcion de la vbibblioteca
if($datos["Nombre_Usuario"] == $_POST["Nombre_Usuario"]){
  if($datos["Contrasena"] == $_POST["Contrasena"]){//Si el nombre y el suaurio son correctos
    $_SESSION["cuenta"] = $_POST["Nombre_Usuario"];//Asigna el valor de la sesion cuenta al nombre del usaurio
    $_SESSION["mensaje"] = 'Sesion iniciada';//Retroalimentacion de la accion
    header('location:../../indexR.php');//Retorna al index para usaurios registrados

  }else{
    $_SESSION["mensaje"] = 'Contraseña Incorrecta';//Si la contraseña no fue correcta
    header('location:../../index.php');
  }
}else{
  $_SESSION["mensaje"] = 'El Usuario o la Contraseña es Incorrecta';//Si la cuenta no existe o la contraseña es incorrecta
  header('location:../../index.php');
}
?>
