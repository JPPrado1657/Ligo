<?php
    session_start();
    require_once("../Biblioteca/biblioteca.php");
    updateSolicitud($_SESSION["cuenta"]);
?>