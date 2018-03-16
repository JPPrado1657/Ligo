<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
editarProducto($_POST["nombre"], $_POST["descripcion"], $_POST["precio"], $_POST["id"] );
//mostrarProductosuUsuario($_POST["usuario"]);
echo getProductosById($_POST["usuario"]);
//hola jejeje
?>
