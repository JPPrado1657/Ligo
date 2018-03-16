<?php

session_start();//Inicia la sesion
$_SESSION["pageName"]="reportarR";
if(isset($_SESSION["productoIDR"]))
  unset($_SESSION["productoIDR"]);

$productoReportar =  $_GET["id"];
$_SESSION["productoIDR"] =  $_GET["id"];
 require_once("php/Biblioteca/biblioteca.php");//Lama a la biblioteca
   include("html/Principal/_headerR.html");//Carga el index de los registrados
   include("html/Reportar/_reportarP.html");
   include("html/Componentes/_add_Button.html");
   include("html/Principal/_footer.html");

 ?>
