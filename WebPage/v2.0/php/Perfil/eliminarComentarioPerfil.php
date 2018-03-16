<?php

session_start();
require_once("../Biblioteca/biblioteca.php");
$id = $_POST["comentario"];
$receptor = $_POST["receptor"];
$registro = getRegistroComentario($id);
if($registro["Emisor"] == $_SESSION["cuenta"]){
    eliminarComentario($id);
}
echo comentariosPerfil($receptor);
?>