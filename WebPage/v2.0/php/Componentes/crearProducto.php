<?php
session_start();//Inicai la sesion
require_once("../Biblioteca/biblioteca.php");//Llama a las librerias






if(isset($_POST["nomCP"],$_POST["desCP"],$_POST["cosCP"],$_POST["catCP"])){//Confirma que los valores hayan sido introducidos
      $nomCP = $_POST ["nomCP"];
      $desCP = $_POST ["desCP"];
      $cosCP = $_POST ["cosCP"];
      $catCP = $_POST ["catCP"];

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

        if (in_array($Img_Ext, $permit)) {
          if ($Img_Error === 0) {
            if ($Img_Tam <= 3145728) {

              $Img_Nuevo_N = uniqid($_SESSION["cuenta"].'_', true).'.'.$Img_Ext;
              $Img_Folder = '../../Recursos/'.$Img_Nuevo_N;


              move_uploaded_file($Img_T, $Img_Folder);
              crearProductoB($nomCP, $desCP, $_SESSION["cuenta"], $catCP, $cosCP, $Img_Nuevo_N);
              header('location:../../Perfil.php?id='.$_SESSION["cuenta"].'');
              $_SESSION["mensaje"] = "Se creó ".$_POST ["nomCP"]." correctamente" ;
            }
            else {
              header('location:../../index.php');
              $_SESSION["mensaje"] = "Tu imagen es muy grande";
              crearProductoB($nomCP, $desCP, $_SESSION["cuenta"], $catCP, $cosCP, "default.png");
            }

          }
          else{
            header('location:../../index.php');
            $_SESSION["mensaje"] = "Tu imagen tiene un error";
            crearProductoB($nomCP, $desCP, $_SESSION["cuenta"], $catCP, $cosCP, "default.png");

          }

        }
        else {
            header('location:../../Perfil.php?id='.$_SESSION["cuenta"].'');
          $_SESSION["mensaje"] = "No cargaste Imagen";
          crearProductoB($nomCP, $desCP, $_SESSION["cuenta"], $catCP, $cosCP, "default.png");
        }


      }
      else{
        crearProductoB($nomCP, $desCP, $_SESSION["cuenta"], $catCP, $cosCP, "default.png");
      }

  }
  else {
    header('location:../../index.php');
    $_SESSION["mensaje"] = "Porfavor llena todos los campos";

  }


 ?>
