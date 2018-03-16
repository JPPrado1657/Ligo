<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
    cancelarSolicitud($_POST["Id_solicitud"]);
?>