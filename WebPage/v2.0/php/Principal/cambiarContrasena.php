<?php
session_start();//Recobra la sesion
require_once("../Biblioteca/biblioteca.php");
if(isset($_SESSION["cuenta"])){//Confirma si esta dado de alta
  if(isset($_POST["ContrasenaA"])){//Confirma parametros enviados
      if(isset($_POST["Contrasena"])){
        $datos = informacionUsuario($_SESSION["cuenta"]);
        if($_POST["ContrasenaA"]==$datos["Contrasena"]){//Si la contraseña Actual es igual a la contraseña almacenada en la base de datos entoncesla sustituye por la nueva
          cambiarContrasena($_POST["Contrasena"],$_SESSION["cuenta"]);
          echo 'Cambio realizado: ¡Tu Contraseña ha sido actualizada!';//Mensaje de Respuesta
        }
        else{
          echo 'Contraseña Actual Incorrecta: No se puede Actualizar';//mensaje de respuesta
        }
      }
  }
}

 ?>
