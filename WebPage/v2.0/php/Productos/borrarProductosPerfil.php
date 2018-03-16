
<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
borrarProducto($_POST["id"]);
echo getProductosById($_POST["usuario"]);
//mostrarProductosuUsuario($_POST["usuario"]);
//echo getProductosById($_POST["usuario"]);
//hola jejeje
?>
