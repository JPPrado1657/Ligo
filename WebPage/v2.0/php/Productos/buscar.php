<?php

session_start();
require_once("../Biblioteca/biblioteca.php");

buscarProductosT($_POST["bus"]);

popOut();

 ?>
