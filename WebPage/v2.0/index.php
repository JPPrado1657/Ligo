 <?php
session_start();//inICIA LA SESION
 require_once("php/Biblioteca/biblioteca.php");//Llama a libreria
 $_SESSION["pageName"]="index";
if(isset($_SESSION['cuenta']) and $_SESSION['cuenta']!= " "){//Si la cuenta existe i es idferente de " " lleva la index de los registrados
  header('location:indexR.php');
}
else{//si no
  $_SESSION['cuenta'] = " ";//Asigna al cuenta a generica
  include("html/Principal/_header.html");//Carga la pagina princiapl para no registrados
  include("html/Principal/_main.html");
  include("html/Principal/_footer.html");
  popOut();//Muestra is hay algun mensaje guardado

}


 ?>
