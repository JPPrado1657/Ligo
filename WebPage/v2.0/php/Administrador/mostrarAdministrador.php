<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
$post = $_POST["id"];
if($post == "Cuentas"){
    echo obtenerUsuarios();
}else if($post == "Categorias"){
    echo obtenerCategorias();
    include("../../html/Componentes/_buttonAdmin.html");
}
?>
