<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
    borrarUsuario($_POST["Nombre_Usuario"]);
echo obtenerUsuarios();
?>