<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
if(isset($_POST["idUbicacion"])&&$_POST["idUbicacion"]!=-1){
    $marker=getRegistroUbicaciones($_POST["idUbicacion"]);
    $lat=$marker["lat"];
    $lng=$marker["lng"];
}else{
    $lat=$_POST["lat"];
    $lng=$_POST["lng"];
}
$vendedor = obtenerVendedor($_POST["Vendedor"]);
insertarSolicitud($_POST["Id_Producto"],$_POST["Cantidad"],$_SESSION["cuenta"],$vendedor, $lat, $lng);
echo "Se ha enviado tu solicitud";
?>
