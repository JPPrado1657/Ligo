<?php
session_start();
require_once("../Biblioteca/biblioteca.php");
if(isset($_POST["view"])){
   if($_POST["view"]!=''){
       updateSolicitud($_SESSION["cuenta"]);
   }   
   $output=primerasSolicitudes($_SESSION["cuenta"]);
   $count=solicitudesUnread($_SESSION["cuenta"]);
   $data = array(
       'notification' => $output,
       'unread' => $count
   );
    echo json_encode($data);
}

?>
