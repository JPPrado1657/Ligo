<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
$datos = array();
$datos = cargaUsuario($_POST["Nombre_Usuario"]);
$data = array(
                "Nombre_Usuario" => $datos[0],
                "Correo" => $datos[1],
                "Id_rol" => $datos[2],
                "Nombre" => $datos[3],
                "Apellido_P" => $datos[4],
                "Apellido_M" => $datos[5],
                "Contrasena" => $datos[6]
             );
echo json_encode($data);

?>
