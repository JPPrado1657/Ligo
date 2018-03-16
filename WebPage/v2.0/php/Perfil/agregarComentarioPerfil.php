<?php

session_start();
require_once("../Biblioteca/biblioteca.php");
$emisor = $_SESSION["cuenta"];
    $receptor = $_POST["receptor"];
    $comentario = $_POST["comentario"];
if(isset($_POST["comentario"]) && $_POST["comentario"] !=""){
    
    agregarComentario($emisor, $receptor, $comentario);
}
echo comentariosPerfil($receptor);
?>