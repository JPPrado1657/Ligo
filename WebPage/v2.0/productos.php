<?php
require_once("php/Biblioteca/biblioteca.php");
session_start();
$_SESSION["pageName"]="productos";

if(isset($_SESSION['cuenta']) and $_SESSION['cuenta']!= " "){//Si la cuenta existe y es idferente de " " lleva la index de los registrados
include("html/Principal/_headerR.html");
include("html/Productos/_producto.html");
include("html/Componentes/_add_Button.html");
include("html/Principal/_footer2.html");
popOut();
}
else{//si no
  $_SESSION['cuenta'] = " ";//Asigna la cuenta a generica
include("html/Principal/_header.html");
include("html/Productos/_producto.html");
include("html/Principal/_footer2.html");
popOut();
}
?>
