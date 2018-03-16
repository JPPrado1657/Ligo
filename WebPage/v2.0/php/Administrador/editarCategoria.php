<?php
    session_start();
    require_once("../Biblioteca/biblioteca.php");
    editarCategorias($_POST["Nombre"], $_POST["Descripcion"], $_POST["Id_Categoria"]);
?>