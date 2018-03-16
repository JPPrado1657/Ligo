<?php

function conectarBD(){ //Conectar a base de datos
  $nombreServidor = "localhost";
  $usuario = "root";
  $contrasena = "";
  $nombreBD= "Ligo";
  //Realiza la conexion
  $conexion = mysqli_connect($nombreServidor,$usuario,$contrasena,$nombreBD);

  if(!$conexion){//Si falla devuelve el error
    die("Conexion Fallida ". mysqli_connect_error());
  }

  return $conexion;
}

function cerrarBD($conexion){ //Cerrar Base de Datos
  mysqli_close($conexion);
}

// function comprobarRegistro($Correo){
//   $conexion = conectarBD();
//   $consulta = 'CALL existe(?)';
//   if(!($sentencia = $conexion->prepare($consulta))){
//     die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
//   }
//   if(!$sentencia->bind_param("s",$Correo)){
//     die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
//   }
//   if(!$datos=$sentencia->execute()){
//     die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
//   }
//   return $datos;
// }


function registrarCuenta($Nombre_Usuario,$Contrasena,$Correo,$Nombre,$Apellido_P,$Apellido_M,$Año_Ing,$Semestre,$img){//Funcion para registrar usuarios nuevos
  $conexion = conectarBD();//Conecta a la base de datos
    $consulta = ' INSERT INTO usuario (Nombre_Usuario,Contrasena,Correo,Nombre,Apellido_P,Apellido_M,Anio_Ing,Semestre,Img_Nom_U)VALUES(?,?,?,?,?,?,?,?,?)';//Llama al procedimiento de registro
    if(!($sentencia = $conexion->prepare($consulta))){//Prepara al consulta
      die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
    }
    if(!$sentencia->bind_param("sssssssss",$Nombre_Usuario,$Contrasena,$Correo,$Nombre,$Apellido_P,$Apellido_M,$Año_Ing,$Semestre,$img)){//Agrega parametros a la consulta
      die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
    }
    if(!$sentencia->execute()){//Ejecuta la consulta
      die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
    }
  cerrarBD($conexion);//Ciera la bae de datos


}

function borrarCuenta($Nombre_Usuario){//Funcion de eliminacion de cuentas
  $conexion = conectarBD();
  $consulta = 'DELETE FROM usuario WHERE Nombre_Usuario = ?';// Consulta de eliminacion a la base de datos
  if(!($sentencia = $conexion->prepare($consulta))){//Prepara la consulta
    die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
  }
  if(!$sentencia->bind_param("s",$Nombre_Usuario)){//Agrega los parametros necesarios
    die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
  }
  if(!$sentencia->execute()){//Ejecuta la consulta
    die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
  }
  cerrarBD($conexion);
}

function iniciarSesion($Nombre_Usuario){//Funcion de inicio de Sesion
  $conexion = conectarBD();
  $consulta = "SELECT Nombre_Usuario, Contrasena FROM usuario
  WHERE Nombre_Usuario ='".$Nombre_Usuario."'";//Llama al procedimiento almacenado

  // if(!($sentencia = $conexion->prepare($consulta))){
  //   die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
  // }
  // if(!$sentencia->bind_param("s",$Nombre_Usuario)){
  //   die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
  // }
  //
  // if(!$datos=$sentencia->execute()){
  //   die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
  // }
  $datos = $conexion->query($consulta);//Realiza la consulta

  $linea = mysqli_fetch_array($datos, MYSQLI_BOTH);//Obtiene la linea resultante
  cerrarBD($conexion);//Cierra la conexion
  return $linea;//Regresa el valor obtenido
}

function informacionUsuario($Nombre_Usuario){//Funcion par aobtener toda la informaciond e un usuario registrado
  $conexion = conectarBD();
  $consulta = "SELECT Nombre, Apellido_P, Apellido_M,Contrasena FROM usuario
  WHERE Nombre_Usuario = '".$Nombre_Usuario."'";//Llama al procedmiento almacenado
  $datos = $conexion->query($consulta);//Ejecuta la consulta

  $linea = mysqli_fetch_array($datos, MYSQLI_BOTH);//Obtiene la consulta
  cerrarBD($conexion);//Cierra la Conexion
  return $linea;//Regresa la linea obtenida
}


function cambiarContrasena($Contrasena,$Sesion){//FUNCION DE CAMBIO DE CONTRASEÑA
  $conexion = conectarBD();
  $consulta = 'UPDATE usuario SET Contrasena = ? WHERE Nombre_Usuario = ?';//Crea la consulta de update de la contraseña introducida
  if(!($sentencia = $conexion->prepare($consulta))){//Prepara la consulta
    die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
  }
  if(!$sentencia->bind_param("ss",$Contrasena,$Sesion)){//Agrega los parametros necesarios
    die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
  }
  if(!$sentencia->execute()){//Ejecuta la consulta
    die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
  }
  cerrarBD($conexion);//Cierra la conexion
}

function popOut(){//Funcison para la obtencion de mensajes respuesta en Front End
  if (isset($_SESSION["mensaje"])) {//Si al variable de sesion mensaje existe
       $mensaje = $_SESSION["mensaje"];
       include("html/Principal/_mensaje.html");//Carga el html con el toast incluido
       unset($_SESSION["mensaje"]);//Vacia la variable
   }
}

function actualizarDatos($Nombre_Usuario,$Nombre,$Apellido_P,$Apellido_M){//Funcion de Actualizar Datos Cambia la informacion personal del usuario
  $conexion = conectarBD();
  $consulta = 'UPDATE usuario SET Nombre = ?, Apellido_P = ?, Apellido_M = ? WHERE Nombre_Usuario = ?';//Genera la consulta
  if(!($sentencia = $conexion->prepare($consulta))){//Prepara la consulta
    die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
  }
  if(!$sentencia->bind_param("ssss",$Nombre,$Apellido_P,$Apellido_M,$Nombre_Usuario)){//Agrega lso aprametros necesarios
    die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
  }
  if(!$sentencia->execute()){//Ejecuta la consulta
    die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
  }
  cerrarBD($conexion);//Cierra la base de datos
  return 'Se ha modificado tu informacion!';//Retorna un mensaje de confirmacion de la accion
}


function getRegistro($conexion, $productoId){
    //Specification of the SQL query
    $query='SELECT * FROM producto WHERE Id_Producto="'.$productoId.'"';
     // Query execution; returns identifier of the result group
    $productos = $conexion->query($query);
    $fila = mysqli_fetch_array($registros, MYSQLI_BOTH);
    return $fila;
}



function getProductos1() {//funcion que imprime todos los productos
    $conexion = conectarBD();//se conecta a la bd
    //Specification of the SQL query
   $query='SELECT P.Id_Producto, P.Nombre_Producto, U.Nombre_Usuario, P.Precio_Producto, P.Descripcion_Producto, P.Img_Nom FROM  producto P, usuario U WHERE U.Nombre_Usuario=P.Nombre_Usuario GROUP BY P.Id_Producto DESC';//hace la consultapara ver tooodos los productos
     // Query execution; returns identifier of the result group
    $productos = $conexion->query($query);//genera


    $cards = "";
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($productos, MYSQLI_BOTH)) {//en este while se imprimen todas las tarjetas
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both

    	$cards .= '


          <div class="col s12 m6 l4">
          <div class="card hoverable" id="cardProd">
          <div class="card-image" >
          <img id="imagencarta" src ="Recursos/'.$fila['Img_Nom'].'" height="200px">
          </div>';

        $cards.='<div class="card-content">
            <span class="card-title">'.$fila['Nombre_Producto'].'</span>
            <p class="truncate valign-wrapper"> '.$fila['Descripcion_Producto'].'</p>
              </div>
              <input id="pmodal" name="pmodal" value="'.$fila['Id_Producto'].'" hidden="hidden"> </input>

             ';

        if ($_SESSION["cuenta"] == $fila["Nombre_Usuario"]){


         $cards.='
         <a class=" col s12 waves-effect waves-light btn compra modal-trigger orange btnpro" id="'.$fila['Id_Producto'].'" onClick="mandarIdProductoEditar(this.id)" href="#modal4" >
         <i class="material-icons left">edit</i>Editar
         </a>';
            }
        else{

         $cards.='
         <div class=" col s8  waves-effect waves-light btn-flat compra modal-trigger gray btnpro btnlft" id="'.$fila['Id_Producto'].'" onClick="mandarIdProducto(this.id)" href="#modal3" >
          <i class="material-icons left">
            info_outline
          </i>
          Info
         </div>';
         /*$cards.='
          <div class=" paypal col s3 modal-action modal-close waves-effect waves-green btn-flat blue btnpro btncntr" href="php/Biblioteca/modelo.php?id='.$fila["Id_Producto"].'" >
            <i class="material-icons">
              payment
            </i>
          </div>';*/
         $cards.='
         <div id='.$fila["Id_Producto"].' class=" solicitud col s4 modal-trigger waves-effect waves-green btn-flat green btnpro btnrght" onclick="solicitudButton(this.id)" href="#modalSolicitud">
          <i class="material-icons">
            attach_money
          </i>
         </div>';

}
          $cards.='</div>

        </div>';

    }
    // it releases the associated results
    mysqli_free_result($productos);//libera la consulta

    cerrarBD($conexion);//se cierra la conexion a la bd

   echo $cards;//se regresan las cartas
}


function getProductos($id) {//funcion que imprime todos los productos
    $conexion = conectarBD();//se conecta a la bd
    $query='SELECT P.Id_Producto, P.Nombre_Producto, U.Nombre_Usuario, P.Precio_Producto, P.Descripcion_Producto, P.Id_Categoria, P.Img_Nom FROM  producto P, usuario U WHERE U.Nombre_Usuario=P.Nombre_Usuario AND P.Id_Categoria="'.$id.'"';//hace la consultapara ver tooodos los productos
     // Query execution; returns identifier of the result group
    $productos = $conexion->query($query);//genera


    $cards = "";
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($productos, MYSQLI_BOTH)) {//en este while se imprimen todas las tarjetas
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both

    	$cards .= '
          <div class="col s12 m6 l4">
          <div class="card hoverable" id="cardProd">
          <div class="card-image" >
          <img id="imagencarta" src ="Recursos/'.$fila['Img_Nom'].'" height="200px">
          </div>';

        $cards.='<div class="card-content">
            <span class="card-title">'.$fila['Nombre_Producto'].'</span>
        <p class="truncate valign-wrapper"> '.$fila['Descripcion_Producto'].'</p>
              </div>
              <input id="pmodal" name="pmodal" value="'.$fila['Id_Producto'].'" hidden="hidden"> </input>

                <input id="cat" value="'.$fila['Id_Categoria'].'" hidden="hidden"></input>
            ';




             if ($_SESSION["cuenta"] == $fila["Nombre_Usuario"]){


          $cards.='     <a class=" col s12 waves-effect waves-light btn compra modal-trigger orange btnpro" id="'.$fila['Id_Producto'].'" onClick="mandarIdProductoEditar(this.id)" href="#modal4" ><i class="material-icons left">edit</i>Editar</a>';
             }
         else{
           $cards.='
           <div class=" col s8  waves-effect waves-light btn-flat compra modal-trigger gray btnpro btnlft" id="'.$fila['Id_Producto'].'" onClick="mandarIdProducto(this.id)" href="#modal3" >
            <i class="material-icons left">
              info_outline
            </i>
            Info
           </div>';
           /*$cards.='
            <div class=" paypal col s3 modal-action modal-close waves-effect waves-green btn-flat blue btnpro btncntr" href="php/Biblioteca/modelo.php?id='.$fila["Id_Producto"].'" >
              <i class="material-icons">
                payment
              </i>
            </div>';*/
           $cards.='
           <div id='.$fila["Id_Producto"].' class=" solicitud col s4 modal-action waves-effect waves-green btn-flat green btnpro btnrght" onclick="solicitarCompra(this.id,1)">
            <i class="material-icons">
              attach_money
            </i>
           </div>';

   }
             $cards.='</div>

         </div>';

     }
    // it releases the associated results
    mysqli_free_result($productos);//libera la consulta

    cerrarBD($conexion);//se cierra la conexion a la bd

   echo $cards;//se regresan las cartas
}




function getProductosById($id) {//funcion que regresa los productos de cada usuario
    $conexion = conectarBD();// conecta base de datos

    //Specification of the SQL query
    $query='SELECT * FROM producto p, usuario u WHERE p.Nombre_Usuario = u.Nombre_Usuario AND u.Nombre_Usuario = "'.$id.'" ORDER BY Fecha_Registro_Producto desc';//consulta
     // Query execution; returns identifier of the result group
    $productos = $conexion->query($query);


    $cards = "";
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($productos, MYSQLI_BOTH)) {//inicia el while para imprimir las cartas
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both

    	$cards .= '


                <div class="col s12 m6 l4">
          <div class="card hoverable" >
          <div class="card-image" >
          <img id="imagencarta" src ="Recursos/'.$fila['Img_Nom'].'" height="200px">
          </div>';

        $cards.='<div class="card-content">
            <span class="card-title">'.$fila['Nombre_Producto'].'</span>
        <p class="truncate valign-wrapper"> '.$fila['Descripcion_Producto'].'</p>
              </div>
              <input id="pmodal" name="pmodal" value="'.$fila['Id_Producto'].'" hidden="hidden"> </input>
              ';

            if (isset($_SESSION["cuenta"]) && $_SESSION["cuenta"] == $fila["Nombre_Usuario"]){


          $cards.='     <a class=" col s12 waves-effect waves-light btn compra modal-trigger orange" id="'.$fila['Id_Producto'].'" onClick="mandarIdProductoEditar(this.id)" href="#modal4" ><i class="material-icons left">edit</i>Editar</a>';
             }
         else{

           $cards.='
           <div class=" col s8  waves-effect waves-light btn-flat compra modal-trigger gray btnpro btnlft" id="'.$fila['Id_Producto'].'" onClick="mandarIdProducto(this.id)" href="#modal3" >
            <i class="material-icons left">
              info_outline
            </i>
            Info
           </div>';
           /*$cards.='
            <div class=" paypal col s3 modal-action modal-close waves-effect waves-green btn-flat blue btnpro btncntr" href="php/Biblioteca/modelo.php?id='.$fila["Id_Producto"].'" >
              <i class="material-icons">
                payment
              </i>
            </div>';*/
           $cards.='
           <div id='.$fila["Id_Producto"].' class=" solicitud col s4 modal-action waves-effect waves-green btn-flat green btnpro btnrght" onclick="solicitarCompra(this.id,1)">
            <i class="material-icons">
              attach_money
            </i>
           </div>';
         }
             $cards.='</div>

         </div>';

         }
    // it releases the associated results
    mysqli_free_result($productos);//libera

    cerrarBD($conexion);//cierra conexion

    echo $cards;//regresa cartas
}
function getProductoRep($id) {//funcion que regresa los productos de cada usuario
    $conexion = conectarBD();// conecta base de datos

    //Specification of the SQL query
    $query='SELECT * FROM producto p, usuario u WHERE p.Nombre_Usuario = u.Nombre_Usuario AND p.Id_Producto = "'.$id.'"';//consulta
     // Query execution; returns identifier of the result group
    $productos = $conexion->query($query);


    $cards = "";
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($productos, MYSQLI_BOTH)) {//inicia el while para imprimir las cartas
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both

    	$cards .= '


                <div class="col s12 m6 l4">
          <div class="card hoverable">
        <div class="card-image">
            <img id="imagencarta" src ="Recursos/'.$fila['Img_Nom'].'" height="200px">
             </div>

        <div class="card-content">
            <span class="card-title">'.$fila['Nombre_Producto'].'</span>
        <p class="truncate valign-wrapper"> '.$fila['Descripcion_Producto'].'</p>
              </div>
              <input id="pmodal" name="pmodal" value="'.$fila['Id_Producto'].'" hidden="hidden"> </input>



         </div>
         </div>';

         }
    // it releases the associated results
    mysqli_free_result($productos);//libera

    cerrarBD($conexion);//cierra conexion

    echo $cards;//regresa cartas
}



function getCategorias() {//mostrara todas las categorias dadas de alta en la base de datos
    $conexion = conectarBD();//abre bd

    //Specification of the SQL query
    $query='SELECT * FROM categoria ORDER BY Nombre_Categoria '; //Realiza la consulta para obtener categorias
     // Query execution; returns identifier of the result group
    $categorias = $conexion->query($query);


    $cards = "";
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($categorias, MYSQLI_BOTH)) {
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both

    	$cards .= '<a id="'.$fila["Id_Categoria"].'" onClick="mostrarProductos(this.id)"  class="collection-item center-align collec ">'.$fila["Nombre_Categoria"].'</a>';//genera la coleccion de botones

    }
    // it releases the associated results
    mysqli_free_result($categorias);//libera la consulta

    cerrarBD($conexion);//cierra sesion bd

    echo $cards;//devuelve la impresion de la coleccion
}

function obtenerCategorias(){
    $conexion = conectarBD();//se genera una conexion con la base;
    $consulta = 'SELECT * FROM categoria';
    $categorias = $conexion->query($consulta);
    $tabla = '<table class="bordered">
              <thead>
              <tr>
              <th>Categoria</th>
              <th>Descripcion</th>
              </tr>
              </thead>
              <tbody>';
    while($fila=mysqli_fetch_array($categorias, MYSQLI_BOTH)){
        $tabla.='
        <tr>
        <td>'.$fila["Nombre_Categoria"].'</td>
        <td>'.$fila["Descripcion_Categoria"].'</td>';
        $tabla.='
        <td><a class="btn-floating btn-large modal-trigger yellow" href="#modalEditarCategoria" id="'.$fila["Id_Categoria"].'"  onClick="mandarIdUsuario(this.id)"><i id="'.$fila["Id_Categoria"].'"  onClick="mandarIdCategoria(this.id)" class="material-icons">edit</i></a></td>
        </tr>';
    }
    mysqli_free_result($categorias);
    cerrarBD($conexion);
    $tabla.="</tbody></table>";
    return $tabla;
}

function obtenerUsuarios(){
    $conexion = conectarBD();
    $consulta = 'SELECT * FROM usuario';
    $usuarios = $conexion->query($consulta);
    $tabla = '<table class="bordered">
              <thead>
              <tr>
              <th>Usuario</th>
              <th>Nombre</th>
              <th>Apellido Paterno</th>
              <th>Apellido Materno</th>
              <th>Correo</th>
              <th>Contraseña</th>
              </tr>
              </thead>
              <tbody>';
    while($fila=mysqli_fetch_array($usuarios, MYSQLI_BOTH)){
        //codificar contraseña
        $password = crypt($fila["Contrasena"], CRYPT_SALT_LENGTH);
        $tabla.='
        <tr>
        <td>'.$fila["Nombre_Usuario"].'</td>
        <td>'.$fila["Nombre"].'</td>
        <td>'.$fila["Apellido_P"].'</td>
        <td>'.$fila["Apellido_M"].'</td>
        <td>'.$fila["Correo"].'</td>
        <td>'.$password.'</td>';
        /*while($fila=mysqli_fetch_array($rolusuario, MYSQLI_BOTH)){
            $tabla.='
            <td>'.$fila["NombreRol"].'</td>';
        }*/
         $tabla.='
        <td><a class="btn-floating btn-large modal-trigger yellow" href="#editarU" id="'.$fila["Nombre_Usuario"].'"  onClick="mandarIdUsuario(this.id)"><i class="material-icons">edit</i></a></td>

        <td><a class="btn-floating btn-large red" id="'.$fila["Nombre_Usuario"].'"  onClick="eliminarUsuario(this.id)"><i class="material-icons">delete</i></a></td>
        </tr>';
    }
    mysqli_free_result($usuarios);
    //mysqli_free_result($rolusuario);
    cerrarBD($conexion);
    $tabla.="</tbody></table>";
    return $tabla;
}


function obtenerDropdownRoles($tabla, $order_by_field, $selected=-1) {
     $conexion = conectarBD();

    //Specification of the SQL query
    $consulta ='SELECT * FROM '.$tabla.' ORDER BY '.$order_by_field;
     // Query execution; returns identifier of the result group
    $registros = $db->query($consulta);

    $seleccionar = '<div class="input-field col s12">
                <select name="'.$tabla.'_id">';

     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both
        if ($seleccionado == $fila["id"]) {
            $seleccionar .= '<option value="'.$fila["id"].'" selected>'.$fila["$order_by_field"].'</option>';
        } else {
            $seleccionar .= '<option value="'.$fila["id"].'">'.$fila["$order_by_field"].'</option>';
        }

    }
    $seleccionar .= '</select><label for="'.$tabla.'">'.$tabla.'</label></div>';
    // it releases the associated results
    mysqli_free_result($registros);

    cerrarBD($db);

    return $seleccionar;
}

function getUserById($conexion, $IdUsuario){//consultapara regresar usuario por id
    //Specification of the SQL query
    $query='SELECT * FROM usuario WHERE Nombre_Usuario="'.$IdUsuario.'"'; //genera la consulta
     // Query execution; returns identifier of the result group
    $registros = $conexion->query($query);//la ingresa en variable
    $fila = mysqli_fetch_array($registros, MYSQLI_BOTH);
    return $fila;//regresa la consulta como array
}

function cargaModal($Id_Producto){//funcion para cargar info del modal
    $conexion = conectarBD();//conecta
     $query='SELECT U.Nombre_Usuario, P.Nombre_Producto, P.Descripcion_Producto, P.Precio_Producto,P.Id_Producto, P.Id_Categoria, P.Img_Nom FROM producto P, usuario U WHERE Id_Producto="'.$Id_Producto.'" AND U.Nombre_Usuario=P.Nombre_Usuario'; //hace laconsulta
     $info = $conexion->query($query);//la meteen variable

    $fila=mysqli_fetch_array($info, MYSQLI_BOTH);//genera un arreglo
    $arreglo = array();
    $arreglo[0]=$fila["Nombre_Producto"];
    $arreglo[1]=$fila["Descripcion_Producto"];
    $arreglo[2]=$fila["Precio_Producto"];
    $arreglo[3]=$fila["Id_Producto"];
    $arreglo[4]=$fila["Nombre_Usuario"];
    $arreglo[5]=$fila["Id_Categoria"];
    $arreglo[6]=$fila["Img_Nom"];

    mysqli_free_result($info);
    cerrarBD($conexion);

    return $arreglo;//lo regresa
}
function cargaCategorias($Id_Categoria){
    $conexion = conectarBD();
    $consulta = 'SELECT Nombre_Categoria, Descripcion_Categoria FROM categoria WHERE Id_Categoria="'.$Id_Categoria.'"';
    $info = $conexion->query($consulta);
    $fila = mysqli_fetch_array($info, MYSQLI_BOTH);
    cerrarBD($conexion);
    $arreglo = array();
    $arreglo[0] = $fila["Nombre_Categoria"];
    $arreglo[1] = $fila["Descripcion_Categoria"];
    return $arreglo;
}
function cargaUsuario($Nombre_Usuario){
    $conexion = conectarBD();
    $consulta = 'SELECT Nombre_Usuario, Correo, Id_rol, Nombre, Apellido_P, Apellido_M, Contrasena FROM usuario WHERE Nombre_Usuario="'.$Nombre_Usuario.'"';
    $info = $conexion->query($consulta);
    $fila = mysqli_fetch_array($info, MYSQLI_BOTH);
    cerrarBD($conexion);
    $arreglo = array();
    $arreglo[0] = $fila["Nombre_Usuario"];
    $arreglo[1] = $fila["Correo"];
    $arreglo[2] = $fila["Id_rol"];
    $arreglo[3] = $fila["Nombre"];
    $arreglo[4] = $fila["Apellido_P"];
    $arreglo[5] = $fila["Apellido_M"];
    $arreglo[6] = $fila["Contrasena"];
    return $arreglo;
}
function editarCategorias($Nombre_Categoria, $Descripcion_Categoria, $Id_Categoria){
    $conexion = conectarBD();
    $consulta = 'UPDATE categoria SET Nombre_Categoria=?, Descripcion_Categoria=? WHERE Id_Categoria="'.$Id_Categoria.'"';
    if (!($sentencia = $conexion->prepare($consulta))) {
        die("Preparation failed: (" . $db->errno . ") " . $db->error);
    }
    if(!$sentencia->bind_param("ss", $Nombre_Categoria, $Descripcion_Categoria)){
        die("Parametros incompletos : (".$sentencia->errno.")".$sentencia->error);
    }
    if ($sentencia->execute()) {
        echo 'There were ' . mysqli_affected_rows($conexion) . ' affected rows';
        header('Location:../../admin.php');
    } else {
        die("Update failed: (" . $sentencia->errno . ") " . $sentencia->error);
    }
    cerrarBD($conexion);
    return("Se ha realizado el cambio");
}
function cargaEditU($Nombre, $Apellido_P, $Apellido_M, $Correo, $Contrasena, $Nombre_Usuario){
    $conexion = conectarBD();
    $consulta = 'UPDATE usuario SET Nombre=?, Apellido_P=?, Apellido_M=?, Correo=?, Contrasena=? WHERE Nombre_Usuario=?';
    if (!($sentencia = $conexion->prepare($consulta))) {
        die("Preparation failed: (" . $db->errno . ") " . $db->error);
    }
    if(!$sentencia->bind_param("ssssss", $Nombre, $Apellido_P, $Apellido_M, $Correo,$Contrasena, $Nombre_Usuario)){
        die("Parametros incompletos : (".$sentencia->errno.")".$sentencia->error);
    }
    if ($sentencia->execute()) {
        echo 'There were ' . mysqli_affected_rows($conexion) . ' affected rows';
        header('Location:../../admin.php');
    } else {
        die("Update failed: (" . $sentencia->errno . ") " . $sentencia->error);
    }
    cerrarBD($conexion);
    return("Se ha realizado el cambio");
}

function debug_to_console( $data ) {
    $output = $data;
    if ( is_array( $output ) )
        $output = implode( ',', $output);

    echo "<script>console.log( 'Debug Objects: " . $output . "' );</script>";
}

function borrarUsuario($Nombre_Usuario){
    $db = conectarBD();
        // insert command specification
        $query='DELETE FROM usuario WHERE Nombre_Usuario=?';
        // Preparing the statement
        if (!($statement = $db->prepare($query))) {
            die("Preparation failed: (" . $db->errno . ") " . $db->error);
        }
        // Binding statement params
        if (!$statement->bind_param("s", $Nombre_Usuario)) {
            die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
        }
        // update execution
        if ($statement->execute()) {
            echo 'There were ' . mysqli_affected_rows($db) . ' affected rows';
            header('Location:../../admin.php');
        } else {
            die("Update failed: (" . $statement->errno . ") " . $statement->error);
        }

        cerrarBD($db);
}
function borrarProducto($Id_Usuario){
    $db = conectarBD();
        // insert command specification
        $query='DELETE FROM producto WHERE Id_Producto=?';
        // Preparing the statement
        if (!($statement = $db->prepare($query))) {
            die("Preparation failed: (" . $db->errno . ") " . $db->error);
        }
        // Binding statement params
        if (!$statement->bind_param("s", $Id_Usuario)) {
            die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
        }
        // update execution
        if ($statement->execute()) {


        } else {
            die("Update failed: (" . $statement->errno . ") " . $statement->error);
        }

        cerrarBD($db);
}

function comentariosPerfil($perfil){//recibe un nombre de perfil y carga los comentario almacenados en este
     $db = conectarBD();
    //Specification of the SQL query
    $query="SELECT c.Id_comentario AS 'id', c.Texto AS 'Comentario', u1.Nombre_Usuario AS 'Emisor', u2.Nombre_Usuario AS 'Receptor', u1.Img_Nom_U AS 'Img_NM'
            FROM comentariosperfil c, usuario u1, usuario u2 WHERE c.Emisor = u1.Nombre_Usuario AND c.Receptor = u2.Nombre_Usuario AND u2.Nombre_Usuario = '".$perfil."'
            ORDER BY c.Id_comentario DESC";
            //genera la consulta
     // Query execution; returns identifier of the result group
    $registros = $db->query($query);//la almacena

    $cards = '';
     // cycle to explode every line of the results
    $i=0;
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {//genera las cartas

        $cards.='
        <div id ="comentariosP" class="card-panel grey lighten-5 z-depth-1">
          <div class="row" id="com_row">
            <div class="col s2">
              <img id="img_comnt" height=75px width="75px" src="Recursos/'.$fila["Img_NM"].'" class="circle">
            </div>
            <div class="col s9">
              <span class="black-text">
                <p id = "ComentarioTxt">'.$fila["Comentario"].'</p>
                <p id = "EmisorC">'.$fila["Emisor"].'</p>

              </span>
            </div>
            ';
            if (isset($_SESSION["cuenta"]) and $_SESSION["cuenta"]!= " "){
            if ($_SESSION["cuenta"] == $fila["Emisor"]){

            $cards.='<div class="col1"><div class="card-action"><a onclick="borrarComentario('.$fila["id"].')"><i class="material-icons" id="icon_c">delete</i></a></div></div>';
            }
        }
          $cards.='</div>
      </div>';
    }

    // it releases the associated results
    mysqli_free_result($registros);//libera la consulta

    cerrarBD($db);//cierra la db

    echo $cards;//regresa las cartas
}
function getProductById($Id_Producto){//consultapara regresar usuario por id
      $conexion = conectarBD();
    //Specification of the SQL query
    $query='SELECT * FROM Producto WHERE Id_Producto="'.$Id_Producto.'"'; //genera la consulta
     // Query execution; returns identifier of the result group
    $registros = $conexion->query($query);//la ingresa en variable
    $fila = mysqli_fetch_array($registros, MYSQLI_BOTH);
    cerrarBD($conexion);
    return $fila;//regresa la consulta como array
}
  function parseToXML($htmlStr)
  {
      $xmlStr=str_replace('<','&lt;',$htmlStr);
      $xmlStr=str_replace('>','&gt;',$xmlStr);
      $xmlStr=str_replace('"','&quot;',$xmlStr);
      $xmlStr=str_replace("'",'&#39;',$xmlStr);
      $xmlStr=str_replace("&",'&amp;',$xmlStr);
      return $xmlStr;
  }

  function getMap(){
      $conexion = conectarBD();
    // Select all the rows in the markers table
      $query = "SELECT * FROM markers WHERE 1";
      $result = $conexion->query($query);
      if (!$result) {
        die('Invalid query: ' . mysql_error());
      }

      header("Content-type: text/xml");

      // Start XML file, echo parent node
      echo '<markers>';

      // Iterate through the rows, printing XML nodes for each

        while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)){
        // Add to XML document node
        echo '<marker ';
        echo 'name="' . parseToXML($row['name']) . '" ';
        echo 'address="' . parseToXML($row['address']) . '" ';
        echo 'lat="' . $row['lat'] . '" ';
        echo 'lng="' . $row['lng'] . '" ';
        echo 'type="' . $row['type'] . '" ';
        echo '/>';
      }

      // End XML file
      echo '</markers>';
  }
  function getDropdownCateg(){
    $conn = conectarBD();
    $sql = "SELECT * FROM categoria ORDER BY Nombre_Categoria ASC";
    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) > 0){
        echo '<div class="input-field col s6"><select name="catCP" id="catCP">';
        echo '<option value="" disabled selected>Escoge categoría</option>';
        while($row = mysqli_fetch_assoc($result)){
            echo '<option value="'.$row["Id_Categoria"].'">'.$row["Nombre_Categoria"].'</option>';

          }

        echo "</select><label>Categoría</label></div>";
    }
    mysqli_free_result($result);

    cerrarBD($conn);

  }
  function getDropdownReportes(){
    $conn = conectarBD();
    $sql = "SELECT * FROM Reporte";
    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) > 0){
        echo '<div class="input-field col s6"><select name = "reporteTipo" id="reporteTipo">';
        while($row = mysqli_fetch_assoc($result)){
            echo '<option value="'.$row["Id"].'">'.$row["Nombre"].'</option>';

          }

        echo "</select><label for='reporteTipo'>Selecciona la razón de tu reporte:</label></div>";
    }
    mysqli_free_result($result);

    cerrarBD($conn);

  }


function getRegistroUbicaciones($id){
    $conexion = conectarBD();
    $consulta = "SELECT * FROM markers WHERE id=".$id;
    $resultado = $conexion->query($consulta);
    $resultado = mysqli_fetch_array($resultado, MYSQLI_BOTH);
    cerrarBD($conexion);
    return $resultado;
}
  function getDropdownUbicaciones(){
      $conn = conectarBD();
    $sql = "SELECT * FROM markers";
    $result = mysqli_query($conn, $sql);

    if(mysqli_num_rows($result) > 0){
        echo '<div class="input-field col s6"><select id="ubicaciones">';
        echo '<option value="UA" selected>Ubicación Actual</option>';
        while($row = mysqli_fetch_assoc($result)){
            echo '<option lat='.$row["lat"].' lng='.$row["lng"].' value='.$row["id"].'>'.$row["name"].'</option>';

          }

        echo "</select><label>Ubicaciones</label></div>";
    }
    mysqli_free_result($result);

    cerrarBD($conn);
  }

  function getDropdownRoles(){
      $conn = conectarBD();
      $sql = "SELECT * FROM rol";
      $result = mysqli_query($conn,$sql);

      if(mysqli_num_rows($result)>0){
          $dropdown= '<div class="input-field col s6"><select id="rol">';
          $dropdown.= '<option id="dropdownSelected" value="" selected></option>';
          while($row = mysqli_fetch_assoc($result)){
              $dropdown.= '<option
              value = "'.$row["Id_Rol"].'">'.$row["NombreRol"].'</option>';
          }
          $dropdown.= "</select><label>Rol</label></div>";
      }
      mysqli_free_result($result);
      cerrarBD($conn);
      return $dropdown;
  }

  function getGeneralDropdown($start){
    $begin = $start;
    $actual = date("Y");


        echo '<div class="input-field col s6"><select id="Anio_Ing" name="Anio_Ing">';
        while($actual >= $begin){
            echo '<option value="'.$actual.'">'.$actual.'</option>';
            $actual -= 1;
          }

        echo "</select><label>Año de Ingreso</label></div>";


  }

  function crearProductoB($nomP, $desP, $id_Ususario, $catP, $cosP, $Img){


      $db = conectarBD();

      // insert command specification
    $query='INSERT INTO producto (`Nombre_Producto`, `Descripcion_Producto`, `Nombre_Usuario`, `Id_Categoria`, `Precio_Producto`, `Img_Nom`) VALUES (?,?,?,?,?,?) ';
    // Preparing the statement
    if (!($statement = $db->prepare($query))) {
        die("Preparation failed: (" . $db->errno . ") " . $db->error);
    }
    // Binding statement params

    if (!$statement->bind_param("ssssss", $nomP, $desP, $id_Ususario, $catP, $cosP, $Img)) {
        die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
    }
    // Executing the statement
    if (!$statement->execute()) {
        die("Execution failed: (" . $statement->errno . ") " . $statement->error);
     }


        cerrarBD($db);


  }

   function editarproducto($nombre, $descripcion, $precio, $id){
    $conexion=conectarBD();
        //Specification of the SQL query
      $consulta = 'UPDATE producto SET Nombre_Producto=?, Descripcion_Producto=?, Precio_Producto=? WHERE Id_Producto=?';
       if(!($sentencia = $conexion->prepare($consulta))){//Prepara la consulta
    die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
  }
  if(!$sentencia->bind_param("ssss",$nombre, $descripcion, $precio, $id)){//Agrega los parametros necesarios
    die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
  }
  if(!$sentencia->execute()){//Ejecuta la consulta
    die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
  }
  cerrarBD($conexion);//Cierra la conexion
}

function agregarComentario($emisor, $receptor, $comentario){
    $db = conectarBD();

    $query = 'INSERT INTO comentariosperfil(`Emisor`, `Receptor`, `Texto`) VALUES (?,?,?)';

    if (!($statement = $db->prepare($query))){
        die("Preparation failed: (" . $db->errno . ") " . $db->error);
    }
    // Binding statement params

    if (!$statement->bind_param("sss", $emisor, $receptor, $comentario)) {
        die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
    }
    // Executing the statement
    if (!$statement->execute()) {
        die("Execution failed: (" . $statement->errno . ") " . $statement->error);
     }
    cerrarBD($db);
}

function eliminarComentario($id){
    $db= conectarBD();

    $query = "DELETE FROM comentariosperfil WHERE Id_comentario='".$id."'";
    $result = mysqli_query($db, $query);
    cerrarBD($db);
    return $result;
}

function obtenerVendedor($Vendedor){
    $conexion = conectarBD();
    $consulta = "SELECT Nombre_Usuario FROM producto WHERE Id_Producto='".$Vendedor."'";
    $consulta = $conexion->query($consulta);
    $resultado = mysqli_fetch_array($consulta, MYSQLI_BOTH);
    mysqli_free_result($consulta);
    cerrarBD($conexion);
    return $resultado[0];
}

function insertarSolicitud($Id_Producto, $Cantidad, $Nombre_Usuario, $Vendedor, $Lat, $Lng){
    $conexion = conectarBD();
    $consulta = 'INSERT INTO solicitud(`Id_Producto`,`Cantidad`, `Nombre_Usuario`,`Vendedor`, `Latitud`, `Longitud`) VALUES(?,?,?,?,?,?)';
    if (!($statement = $conexion->prepare($consulta))){
        die("Preparation failed: (" . $conexion->errno . ") " . $conexion->error);
    }
    // Binding statement params

    if (!$statement->bind_param("ssssss",$Id_Producto, $Cantidad, $Nombre_Usuario, $Vendedor, $Lat, $Lng)) {
        die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
    }
    // Executing the statement
    if (!$statement->execute()) {
        die("Execution failed: (" . $statement->errno . ") " . $statement->error);
     }
    cerrarBD($conexion);
}

function crearCategoriaB($nomC, $desC){


    $db = conectarBD();

    // insert command specification
  $query='INSERT INTO categoria (`Nombre_Categoria`, `Descripcion_Categoria`) VALUES (?,?) ';
  // Preparing the statement
  if (!($statement = $db->prepare($query))) {
      die("Preparation failed: (" . $db->errno . ") " . $db->error);
  }
  // Binding statement params

  if (!$statement->bind_param("ss", $nomC, $desC)) {
      die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
  }
  // Executing the statement
  if (!$statement->execute()) {
      die("Execution failed: (" . $statement->errno . ") " . $statement->error);
   }


      cerrarBD($db);


}

function getRegistroComentario($id){
    $conexion = conectarBD();
    $consulta = "SELECT * FROM comentariosperfil WHERE Id_comentario=".$id;
    $consulta = $conexion->query($consulta);
    $resultado = mysqli_fetch_array($consulta, MYSQLI_BOTH);
    mysqli_free_result($consulta);
    cerrarBD($conexion);
    return $resultado;
}

function obtenerRol($Nombre_Usuario){
    $conexion = conectarBD();
    $consulta = 'SELECT Id_rol FROM usuario WHERE Nombre_Usuario = "'.$Nombre_Usuario.'"';
    $resultado = $conexion->query($consulta);
    $fila = mysqli_fetch_array($resultado, MYSQLI_BOTH);
    cerrarBD($conexion);
    if($fila[0]==5){
        return '<li class="divider"></li>
            <li><a href="admin.php">Vista Administrador</a>
            </li>';
    }else
        return 0;
}

function notificacionesById($Nombre_Usuario){
    $conexion = conectarBD();
    $consulta = 'SELECT * FROM solicitud WHERE Vendedor="'.$Nombre_Usuario.'"';
    $resultado = $conexion->query($consulta);
    $drop="";
    while($fila = mysqli_fetch_array($resultado, MYSQLI_BOTH)){
        $drop.='<li></li>';
    }

}

function updateSolicitud($Nombre_Usuario){
    $conexion = conectarBD();
    $consulta = 'UPDATE solicitud SET Leido=true WHERE Leido=false AND Vendedor="'.$Nombre_Usuario.'"';
    $consulta2 = 'UPDATE solicitud SET Toasted=true WHERE Toasted=false AND Nombre_Usuario="'.$Nombre_Usuario.'"';
    $conexion->query($consulta);
    $conexion->query($consulta2);
  cerrarBD($conexion);//Cierra la conexion
}

function aceptarSolicitud($Id_solicitud){
    $conexion = conectarBD();
    $consulta = 'UPDATE solicitud SET Aceptado=true WHERE Id_solicitud='.$Id_solicitud.'';
    $conexion->query($consulta);
    cerrarBD($conexion);
}

function cancelarSolicitud($Id_solicitud){
    $conexion = conectarBD();
    $consulta = 'UPDATE solicitud SET Aceptado=false WHERE Id_solicitud='.$Id_solicitud.'';
    $conexion->query($consulta);
    cerrarBD($conexion);
}

function primerasSolicitudes($Nombre_Usuario){
    $conexion = conectarBD();
    $consulta = 'SELECT * FROM solicitud WHERE Nombre_Usuario='.$Nombre_Usuario.' ORDER BY FechaGeneracion DESC LIMIT 5';
    $resultado = mysqli_query($conexion,$consulta);
    $output="";
    if(mysqli_num_rows($resultado)>0){
        while($fila = mysqli_fetch_array($result)){
            $output.='
            ';
        }
    }else{
        $output .= '<li>
          <a href="#">
          <strong>'.$row["Cantidad"].'</strong><br />
          <small><em>'.$row["Id_Ubicacion"].'</em></small>
          </a>
          </li>';
    }
    cerrarBD($conexion);
    return $output;
}

function solicitudesUnread($Nombre_Usuario){
    $conexion = conectarBD();
    $consulta2 = 'SELECT * FROM `solicitud` WHERE Aceptado IS NOT NULL AND Toasted=false AND Nombre_Usuario="'.$Nombre_Usuario.'"';
    $consulta3 = 'SELECT * FROM solicitud WHERE Aceptado IS NULL AND Vendedor="'.$Nombre_Usuario.'"';
    $resultado2 = mysqli_query($conexion, $consulta2);
    $resultado3 = mysqli_query($conexion, $consulta3);
    $count2 = mysqli_num_rows($resultado2);
    $count3 = mysqli_num_rows($resultado3);
    $sum = $count2 + $count3;
    cerrarBD($conexion);
    return $sum;
}
function reportarUsuario($U_Reportador,$U_Reportado,$Tipo_Reporte,$Descripcion){
  $conexion = conectarBD();//Conecta a la base de datos
    $consulta = ' INSERT INTO ReporteUsuario (U_Reportador,U_Reportado,Tipo_Reporte,Descripcion)VALUES(?,?,?,?)';//Llama al procedimiento de registro
    if(!($sentencia = $conexion->prepare($consulta))){//Prepara al consulta
      die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
    }
    if(!$sentencia->bind_param("ssss",$U_Reportador,$U_Reportado,$Tipo_Reporte,$Descripcion)){//Agrega parametros a la consulta
      die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
    }
    if(!$sentencia->execute()){//Ejecuta la consulta
      die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentecia->error);
    }
  cerrarBD($conexion);//Ciera la bae de datos
  return "Reporte de usuario enviado";
}

function usuarioProducto($id){
  $conexion = conectarBD();// conecta base de datos

  //Specification of the SQL query
  $query='SELECT u.Nombre_Usuario FROM producto p, usuario u WHERE p.Nombre_Usuario = u.Nombre_Usuario AND p.Id_Producto = "'.$id.'"';//consulta
   // Query execution; returns identifier of the result group
  $consulta = $conexion->query($query);


  $ans = "";
   // cycle to explode every line of the results
  while ($fila = mysqli_fetch_array($consulta, MYSQLI_BOTH)) {//inicia el while para imprimir las cartas
                                              // Options: MYSQLI_NUM to use only numeric indexes
                                              // MYSQLI_ASSOC to use only name (string) indexes
                                              // MYSQLI_BOTH, to use both

    $ans.= $fila[0];

       }
  // it releases the associated results
  mysqli_free_result($consulta);//libera
  cerrarBD($conexion);//cierra conexion

  return $ans;
}
function reportarProducto($U_Reportador,$Tipo_Reporte,$Descripcion,$P_Reportado){
  $conexion = conectarBD();//Conecta a la base de datos
  $U_Reportado = usuarioProducto($P_Reportado);
    $consulta = ' INSERT INTO ReporteUsuario (U_Reportador,U_Reportado,Tipo_Reporte,Descripcion,P_Reportado)VALUES(?,?,?,?,?)';//Llama al procedimiento de registro
    if(!($sentencia = $conexion->prepare($consulta))){//Prepara al consulta
      die('Preparacion de consulta fallida('.$conexion->errno.') '.$conexion->error);
    }
    if(!$sentencia->bind_param("sssss",$U_Reportador,$U_Reportado,$Tipo_Reporte,$Descripcion,$P_Reportado)){//Agrega parametros a la consulta
      die('Vinculacion de parametros fallida('.$sentencia->errno.') '.$sentencia->error);
    }
    if(!$sentencia->execute()){//Ejecuta la consulta
      die('Ejecucion Fallida ('.$sentencia->errno.') '.$sentencia->error);
    }
  cerrarBD($conexion);//Ciera la bae de datos
  return "Reporte de producto enviado";
}

function buscarProductosT($bus){
  $conexion = conectarBD();//se conecta a la bd

  //Specification of the SQL query
 $query= "SELECT Id_Producto, Nombre_Producto, Nombre_Usuario, Precio_Producto, Descripcion_Producto, Img_Nom FROM  producto  WHERE Nombre_Producto LIKE  '%".$bus."%'  OR  Nombre_Usuario LIKE  '%".$bus."%' ";//hace la consultapara ver tooodos los productos
   // Query execution; returns identifier of the result group
  $productos = $conexion->query($query);//genera


  $cards = '<h4 id="h2busqueda"> Buscando: '.$bus.' </h4><div class = "row">';
   // cycle to explode every line of the results
  while ($fila = mysqli_fetch_array($productos, MYSQLI_BOTH)) {//en este while se imprimen todas las tarjetas
                                              // Options: MYSQLI_NUM to use only numeric indexes
                                              // MYSQLI_ASSOC to use only name (string) indexes
                                              // MYSQLI_BOTH, to use both

    $cards .= '


        <div class="col s12 m6 l3">
        <div class="card hoverable" id="cardProd">
        <div class="card-image">
          <img id="imagencarta" src ="Recursos/'.$fila['Img_Nom'].'" height="200px">
        </div>';

      $cards.='<div class="card-content">
          <span class="card-title">'.$fila['Nombre_Producto'].'</span>
          <p class="truncate valign-wrapper"> '.$fila['Descripcion_Producto'].'</p>
            </div>
            <input id="pmodal" name="pmodal" value="'.$fila['Id_Producto'].'" hidden="hidden"> </input>

           ';

      if ($_SESSION["cuenta"] == $fila["Nombre_Usuario"]){


       $cards.='
       <a class=" col s12 waves-effect waves-light btn compra modal-trigger orange btnpro" id="'.$fila['Id_Producto'].'" onClick="mandarIdProductoEditar(this.id)" href="#modal7" >
       <i class="material-icons left">edit</i>Editar
       </a>';
          }
      else{

       $cards.='
       <div class=" col s8  waves-effect waves-light btn-flat compra modal-trigger gray btnpro btnlft" id="'.$fila['Id_Producto'].'" onClick="mandarIdProducto(this.id)" href="#modal3" >
        <i class="material-icons left">
          info_outline
        </i>
        Info
       </div>';
      /* $cards.='
        <div class=" paypal col s3 modal-action modal-close waves-effect waves-green btn-flat blue btnpro btncntr" href="php/Biblioteca/modelo.php?id='.$fila["Id_Producto"].'" >
          <i class="material-icons">
            payment
          </i>
        </div>';*/
       $cards.='
         <div id='.$fila["Id_Producto"].' class=" solicitud col s4 modal-trigger waves-effect waves-green btn-flat green btnpro btnrght" onclick="solicitudButton(this.id)" href="#modalSolicitud">
          <i class="material-icons">
            attach_money
          </i>
         </div>';

}
        $cards.='</div>

      </div>
      ';
}

// it releases the associated results
mysqli_free_result($productos);//libera la consulta

cerrarBD($conexion);//se cierra la conexion a la bd

echo $cards;//se regresan las cartas
}

function infoSolicitud($id){
    $conexion = conectarBD();
    $consulta = "SELECT P.Nombre_Producto, S.Cantidad, S.Descripcion, S.FechaGeneracion, S.Latitud, S.Longitud FROM solicitud S, producto P WHERE S.Id_solicitud=".$id." AND  S.Id_Producto=P.Id_Producto";
    $resultado = $conexion->query($consulta);
    $resultado = mysqli_fetch_array($resultado, MYSQLI_BOTH);
    cerrarBD($conexion);
    return $resultado;
}

function getMensajesNotificaciones($Nombre_Usuario){
    $conexion = conectarBD();
    $vendidos = 'SELECT S.Id_solicitud, S.Nombre_Usuario, S.Cantidad, P.Nombre_Producto FROM solicitud S, producto P WHERE Vendedor="'.$Nombre_Usuario.'" AND S.Id_Producto=P.Id_Producto AND Aceptado IS NULL';
    $respuesta = 'SELECT S.Aceptado, S.Vendedor, P.Nombre_Producto FROM solicitud S, producto P WHERE S.Nombre_Usuario="'.$Nombre_Usuario.'" AND P.Id_Producto=S.Id_Producto AND S.Toasted=false AND S.Aceptado IS NOT NULL ';
    $vendidosM = $conexion->query($vendidos);
    $mensajes = "";
    if(mysqli_num_rows($vendidosM)>0){
        while($fila = mysqli_fetch_array($vendidosM, MYSQLI_BOTH)){
            // class ="modal-trigger" href="#modalMasterPro"
            //onClick=infoSolicitud(this.id)
            $mensajes.='<li id='.$fila["Id_solicitud"].'>'.$fila["Nombre_Usuario"].' ha solicitado '.$fila["Cantidad"].' '.$fila["Nombre_Producto"].' en (lugar)<div class="row">
                            <div class="col s2">
                            <a id="'.$fila["Id_solicitud"].'" class="notificacionesCheck" onClick="aceptarSolicitud(this.id)"><i class="notifIconCheck fa fa-check" aria-hidden="true"></i></a>
                            </div>
                            <div class="col s2">
                            <a id="'.$fila["Id_solicitud"].'" class="notificacionesTimes"onClick="cancelarSolicitud(this.id)"><i class="notifIconTimes fa fa-times" aria-hidden="true"></i></a>
                            </div>
                        </div></li>';
        }
    }
    $respuestaM = $conexion->query($respuesta);
    if(mysqli_num_rows($respuestaM)>0){
        while($row = mysqli_fetch_array($respuestaM, MYSQLI_BOTH)){
            if($row["Aceptado"]==true){
                $mensajes.='<li>'.$row["Vendedor"].' ha aceptado tu solicitud </li>';
            }else if($row["Aceptado"]==false){
                $mensajes.='<li>'.$row["Vendedor"].' ha rechazado tu solicitud </li>';
            }
        }
    }
    mysqli_free_result($respuestaM);
    mysqli_free_result($vendidosM);
    //updateSolicitud($Nombre_Usuario);
    cerrarBD($conexion);
    return $mensajes;
}

function getDropdownPromos(){
  $conn = conectarBD();
  $sql = "SELECT * FROM promocion ORDER BY Id_Promo ASC";
  $result = mysqli_query($conn, $sql);

  if(mysqli_num_rows($result) > 0){
      echo '<div class="input-field col s6" promoSelect><select id="nomPromo">';
      echo '<option value="" disabled selected>0% de descuento</option>';
      while($row = mysqli_fetch_assoc($result)){
          echo '<option value="'.$row["Id_Promo"].'">'.$row["nombre_P"].'</option>';

        }

      echo "</select><label>Promoción</label></div>";
  }
  mysqli_free_result($result);

  cerrarBD($conn);

}
function getDropdownPoductos($usuario){
  $conn = conectarBD();
  $sql = 'SELECT * FROM producto WHERE Nombre_Usuario = "'.$usuario.'" ORDER BY Nombre_Producto ASC ';
  $result = mysqli_query($conn, $sql);

  if(mysqli_num_rows($result) > 0){
      echo '<div class="input-field col s6"><select id="nomProductoPromo">';
      echo '<option value="" disabled selected>tus productos</option>';
      while($row = mysqli_fetch_assoc($result)){
          echo '<option value="'.$row["Id_Producto"].'">'.$row["Nombre_Producto"].'</option>';

        }

      echo "</select><label>Productos</label></div>";
  }
  mysqli_free_result($result);

  cerrarBD($conn);

}
function getImagen($Nombre_Usuario){//Funcion par aobtener toda la informaciond e un usuario registrado
  $conn = conectarBD();
  $sql = 'SELECT Img_Nom_U FROM usuario WHERE Nombre_Usuario = "'.$Nombre_Usuario.'" ';
  $result = mysqli_query($conn, $sql);
  $row = mysqli_fetch_array($result, MYSQLI_BOTH);
  $final = '<img id="ImagenP"  src="Recursos/'.$row["Img_Nom_U"].'"  height="180px" width="180px">';
  echo $final;

  mysqli_free_result($result);

  cerrarBD($conn);




}
function getImagenProducto($id){//Funcion par aobtener toda la informaciond e un usuario registrado
  $conn = conectarBD();
  $sql = 'SELECT Img_Nom FROM producto WHERE Id_Producto = "'.$id.'" ';
  $result = mysqli_query($conn, $sql);
  $row = mysqli_fetch_array($result, MYSQLI_BOTH);
  $final = '<img id="ImagenP"  src="Recursos/'.$row["Img_Nom"].'"  height="180px" width="180px">';
  echo $final;

  mysqli_free_result($result);

  cerrarBD($conn);




}
function getProductosRecientes($cantidad) {//funcion que imprime todos los productos
    $conexion = conectarBD();//se conecta a la bd
    $query='SELECT * FROM producto ORDER BY Fecha_Registro_Producto DESC LIMIT '.$cantidad;//hace la consultapara ver tooodos los productos
     // Query execution; returns identifier of the result group
    $productos = $conexion->query($query);//genera


    $cards = "";
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($productos, MYSQLI_BOTH)) {//en este while se imprimen todas las tarjetas
                                                // Options: MYSQLI_NUM to use only numeric indexes
                                                // MYSQLI_ASSOC to use only name (string) indexes
                                                // MYSQLI_BOTH, to use both

    	$cards .= '
          <div class="col s12 m6 l3">
          <div class="card hoverable" id="cardProd">
          <div class="card-image" >
          <img id="imagencarta" src ="Recursos/'.$fila['Img_Nom'].'" height="200px">
          </div>';

        $cards.='<div class="card-content">
            <span class="card-title">'.$fila['Nombre_Producto'].'</span>
        <p class="truncate valign-wrapper"> '.$fila['Descripcion_Producto'].'</p>
              </div>
              <input id="pmodal" name="pmodal" value="'.$fila['Id_Producto'].'" hidden="hidden"> </input>

                <input id="cat" value="'.$fila['Id_Categoria'].'" hidden="hidden"></input>
            ';




             if ($_SESSION["cuenta"] == $fila["Nombre_Usuario"]){


          $cards.='     <a class=" col s12 waves-effect waves-light btn compra modal-trigger orange btnpro" id="'.$fila['Id_Producto'].'" onClick="mandarIdProductoEditar(this.id)" href="#modal4" ><i class="material-icons left">edit</i>Editar</a>';
             }
         else{
           $cards.='
           <div class=" col s8  waves-effect waves-light btn-flat compra modal-trigger gray btnpro btnlft" id="'.$fila['Id_Producto'].'" onClick="mandarIdProducto(this.id)" href="#modal3" >
            <i class="material-icons left">
              info_outline
            </i>
            Info
           </div>';
           /*$cards.='
            <div class=" paypal col s3 modal-action modal-close waves-effect waves-green btn-flat blue btnpro btncntr" href="php/Biblioteca/modelo.php?id='.$fila["Id_Producto"].'" >
              <i class="material-icons">
                payment
              </i>
            </div>';*/
            $cards.='
            <div id='.$fila["Id_Producto"].' class=" solicitud col s4 modal-trigger waves-effect waves-green btn-flat green btnpro btnrght" onclick="solicitudButton(this.id)" href="#modalSolicitud">
             <i class="material-icons">
               attach_money
             </i>
            </div>';


   }
             $cards.='</div>

         </div>';

     }
    // it releases the associated results
    mysqli_free_result($productos);//libera la consulta

    cerrarBD($conexion);//se cierra la conexion a la bd

   echo $cards;//se regresan las cartas
}

function getImagenP($producto){//Funcion par aobtener toda la informaciond e un usuario registrado
  $conn = conectarBD();
  $sql = 'SELECT Img_Nom FROM producto WHERE Id_Producto = "'.$producto.'" ';
  $result = mysqli_query($conn, $sql);
  $row = mysqli_fetch_array($result, MYSQLI_BOTH);
  $final = '<img id="imagencarta" width="250px" src="Recursos/'.$row["Img_Nom"].'">';
  echo $final;

  mysqli_free_result($result);

  cerrarBD($conn);
}



?>
