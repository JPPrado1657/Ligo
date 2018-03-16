<?php
    session_start();
    require_once("php/Biblioteca/biblioteca.php");

    $_SESSION["pageName"]="admin";
    include("html/Principal/_headerR.html");
     
    include("html/Administrador/_AgregarRegistro.html");
    include("html/Administrador/_modalsAdmin.html");
    include("html/Principal/_footer2.html");
?>
