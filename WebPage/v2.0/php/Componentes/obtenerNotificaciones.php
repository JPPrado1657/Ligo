<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
$switch = $_POST["switch"];
    if($switch == "numero"){
        echo solicitudesUnread($_SESSION["cuenta"]);
    }
    else if($switch == "mensaje"){
        echo getMensajesNotificaciones($_SESSION["cuenta"]);
    }
?>