<?php

session_start();//Inicia la sesion
$_SESSION["pageName"]="reportar";
$usuarioReportar =  $_GET["id"];
 require_once("php/Biblioteca/biblioteca.php");//Lama a la biblioteca
   include("html/Principal/_headerR.html");//Carga el index de los registrados
   include("html/Reportar/_reportar.html");
   include("html/Componentes/_add_Button.html");
   include("html/Principal/_footer.html");




?>
