<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
$count = solicitudesUnread($_SESSION["cuenta"]);
echo $count;
?>