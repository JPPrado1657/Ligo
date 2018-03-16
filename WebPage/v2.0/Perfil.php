<?php
    session_start();
    require_once("php/Biblioteca/biblioteca.php");
    $_SESSION["pageName"]="perfil";
    if(!isset($_GET["id"])){
        $registro = getUserById(conectarBD(), "miguelxngx");
    }else{
        $registro = getUserById(conectarBD(), $_GET["id"]);
    }
    if(isset($_SESSION['cuenta']) and $_SESSION['cuenta']!= " "){
        include("html/Principal/_headerR.html");
        include("html/perfil/_perfilN.html");
        include("html/Principal/_footer2.html");
        include("html/Componentes/_add_Button.html");
        popOut();

    }else{
        include("html/Principal/_header.html");
        include("html/perfil/_perfilN.html");
        include("html/Principal/_footer2.html");
    }
?>
