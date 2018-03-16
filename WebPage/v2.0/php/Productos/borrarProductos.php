<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
borrarProducto($_POST["id"]);
//getProductos1();
getProductos1();
?>