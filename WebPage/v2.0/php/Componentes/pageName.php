<?php
require_once("../Biblioteca/biblioteca.php");
session_start();
if(isset($_SESSION['pageName'])){
    echo $_SESSION["pageName"];
}else{
    echo "0";
}
//echo $session;
?>
