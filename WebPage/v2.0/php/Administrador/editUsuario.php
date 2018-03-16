<?php 
    session_start();
    require_once("../Biblioteca/biblioteca.php");
    cargaEditU($_POST["Nombre"], $_POST["Apellido_P"], $_POST["Apellido_M"],$_POST["Correo"],$_POST["Rol"],$_POST["Contrasena"],$_SESSION["cuenta"]);
    echo obtenerUsuarios();
?>