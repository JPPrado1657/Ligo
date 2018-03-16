<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
$datos = array();
$datos = cargaModal($_POST["Id_Producto"]);

$data = array(
                "nombre" => $datos[0],
                "descripcion" => $datos[1],
                "precio" => $datos[2],
                "id" => $datos[3],
                "usuario" => $datos[4],
                "categoria" => $datos[5],
                "imagen" => $datos[6]

             );
echo json_encode($data);
?>
