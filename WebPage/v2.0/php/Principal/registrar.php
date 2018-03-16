<?php
session_start();//Recobra la sesion
require_once("../Biblioteca/biblioteca.php");//Importa las librerias
if(isset($_POST["Nombre_Usuario"],$_POST["Contrasena"],$_POST["Correo"],$_POST["Nombre"],$_POST["Apellido_P"],$_POST["Apellido_M"],$_POST["Anio_Ing"],$_POST["Semestre"])){//Confirma que cada campo haya sido introducido

  //Checar que puso Imagen
  if (isset($_FILES["Img_F"])) {
    $Img = $_FILES["Img_F"];

    //Propiedades de la imagen
    $Img_N = $Img["name"];
    $Img_T = $Img["tmp_name"];
    $Img_Tam = $Img["size"];
    $Img_Error = $Img["error"];

    //Extension

    $Img_Ext = explode(".", $Img_N);
    $Img_Ext = strtolower(end($Img_Ext));

    $permit = array('jpeg','png','jpg','gif');
    echo $permit;

    if (in_array($Img_Ext, $permit)) {
      if ($Img_Error === 0) {
        if ($Img_Tam <= 3145728) {

          $Img_Nuevo_N = uniqid('_', true).'.'.$Img_Ext;
          $Img_Folder = '../../Recursos/'.$Img_Nuevo_N;


          move_uploaded_file($Img_T, $Img_Folder);
          registrarCuenta($_POST["Nombre_Usuario"],$_POST["Contrasena"],$_POST["Correo"],$_POST["Nombre"],$_POST["Apellido_P"],$_POST["Apellido_M"],$_POST["Anio_Ing"],$_POST["Semestre"],$Img_Nuevo_N);
          //Asinga a las variables de sesiones la cuenta del usaurio (id) y como mensaje la accionq ue se realizo
          $_SESSION['cuenta'] = $_POST["Nombre_Usuario"];
          $_SESSION['mensaje'] = 'Registro existoso, bienvenid@ a Ligo: "'.$_POST["Nombre"].'"';
          header('location:../../indexR.php');//Retorna al index para sesiones iniciadas
        }
        else {
          header('location:../../index.php');
          $_SESSION["mensaje"] = "Tu imagen es muy grande";
        }

      }
      else{
        header('location:../../index.php');
        $_SESSION["mensaje"] = "Tu imagen tiene un error";
      }

    }
    else {
        header('location:../../index.php');
      $_SESSION["mensaje"] = "Tu imagen no es PNG, JPG, JPEG O GIF";
    }


  }


  }






?>
