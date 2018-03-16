<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
$drop = getDropdownUbicaciones();
echo $drop;
?>
