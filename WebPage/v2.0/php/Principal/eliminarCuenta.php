<?php
session_start();//Obtiene la sesion en curso
require_once("../Biblioteca/biblioteca.php");//aoBTIENE LAS LIBRERIAS
if(isset($_SESSION["cuenta"]) and $_SESSION["cuenta"]!=" "){//Confirma que este activa la cuenta y no sea una generica
    borrarCuenta($_SESSION['cuenta']);//Llama al procedimiento de eliminar cuenta
    $_SESSION = array();

    // If it's desired to kill the session, also delete the session cookie.
    // Note: This will destroy the session, and not just the session data!
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }

    // Finally, destroy the session.
    session_destroy();
    header('location:../../index.php');//Regresa al index de no sesionados
}
 ?>
