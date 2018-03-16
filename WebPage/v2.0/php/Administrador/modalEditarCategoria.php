<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
$datos = array();
$datos = cargaCategorias($_POST["Id_Categoria"]);
$data = array(
                "nombre" => $datos[0],
                "descripcion" => $datos[1]
             );
echo json_encode($data);
?>