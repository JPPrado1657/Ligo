<?php
require_once("../Biblioteca/biblioteca.php");
session_start();
if(isset($_SESSION['cuenta']) and $_SESSION['cuenta']!= " "){
    echo $_SESSION["cuenta"];
}else{
    echo "F";
}
//echo $session;
?>