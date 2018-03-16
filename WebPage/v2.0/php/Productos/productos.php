<?php

if(isset($_SESSION['cuenta']) and $_SESSION['cuenta']!= " "){//Si la cuenta existe i es idferente de " " lleva la index de los registrados
  include("../../html/Principal/_headerR.html");
include("../../html/Productos/_producto.html");
include("../../html/Principal/_footer.html");
}
else{//si no
  $_SESSION['cuenta'] = " ";//Asigna al cuenta a generica
include("../../html/Principal/_header.html");
include("../../html/Productos/_producto.html");
include("../../html/Principal/_footer.html");
}

?>
