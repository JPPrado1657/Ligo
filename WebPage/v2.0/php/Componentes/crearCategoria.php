<?php
session_start();//Inicai la sesion
require_once("../Biblioteca/biblioteca.php");//Llama a las librerias

if(isset($_POST["nomCC"],$_POST["desCC"])){//Confirma que los valores hayan sido introducidos

      $nomCC = $_POST ["nomCC"];
      $desCC = $_POST ["desCC"];
      crearCategoriaB($nomCC, $desCC);
      //Ejecuta la funcion de la biblioteca para la modificacion del perfil
      echo "Se creo  correctamente" ;
  }

 ?>
