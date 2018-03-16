<?php

    session_start();
    require_once("../Biblioteca/biblioteca.php");
    
    $datos = array();
    $datos = infoSolicitud($_POST["Id_Solicitud"]);

    $data = array(
        "NombreProducto" => $datos[0],
        "Cantidad" => $datos[1],
        "Descripcion" => $datos[2],
        "Fecha" => $datos[3],
        "Latitud" => $datos[4],
        "Longitud" => $datos[5]
    );

    echo json_encode($data);
?>