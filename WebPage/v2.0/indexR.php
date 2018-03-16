 <?php
  session_start();//Inicia la sesion
   require_once("php/Biblioteca/biblioteca.php");//Lama a la biblioteca
   $_SESSION["pageName"]="indexR";
   if(isset($_SESSION['cuenta']) and $_SESSION['cuenta']!=" "){//Corrabora que la sesion este iniciada y no sea generica
     $_SESSION["informacion"]= informacionUsuario($_SESSION["cuenta"]);//obtiene la informaciond el usaurio con la funcion de la biblioteca
     include("html/Principal/_headerR.html");//Carga el index de los registrados
    
     include("html/Principal/_main.html");
     include("html/Principal/_footer.html");
     include("html/Componentes/_add_Button.html");
     popOut();

   }
   else{//De lo contrario
     header('location:index.php');//Carga el index de los no registrados
 }

 ?>
