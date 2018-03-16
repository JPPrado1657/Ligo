//Request of Object via Ajax
function getRequestObject() {
  // Asynchronous objec created, handles browser DOM differences
  if (window.XMLHttpRequest) {
    // Mozilla, Opera, Safari, Chrome IE 7+
    return (new XMLHttpRequest());
  } else if (window.ActiveXObject) {
    // IE 6-
    return (new ActiveXObject('Microsoft.XMLHTTP'));
  } else {
    // Non AJAX browsers
    return (null);
  }
}
var customLabel = {
  restaurant: {
    label: 'Rest'
  },
  bar: {
    label: 'Bar'
  }
};

function downloadUrl(url,callback) {
 var request = window.ActiveXObject ?
     new ActiveXObject('Microsoft.XMLHTTP') :
     new XMLHttpRequest;

 request.onreadystatechange = function() {
   if (request.readyState == 4) {
     request.onreadystatechange = doNothing;
     callback(request, request.status);
   }
 };

 request.open('GET', url, true);
 request.send(null);
}
function doNothing() {}

function showMaxZoom(e) {
  maxZoomService.getMaxZoomAtLatLng(e.latLng, function(response) {
    if (response.status !== 'OK') {
      infoWindow.setContent('Error in MaxZoomService');
    } else {
      infoWindow.setContent(
          'The maximum zoom at this location is: ' + response.zoom);
    }
    infoWindow.setPosition(e.latLng);
    infoWindow.open(map);
  });
}

function actualizarDatos() {//Funcion asincrona de actualizacion  de datos
  $.post('php/Principal/modificarPerfil.php', {//Post a PHP de modificar perfil dando los parametros de Nombre y apellidos
      Nombre: document.getElementById('Nombre').value,
      Apellido_P: document.getElementById('Apellido_P').value,
      Apellido_M: document.getElementById('Apellido_M').value
    })
    .done(function (data) {
      Materialize.toast(data, 3000, 'rounded');//Genera un toast como respuesta
    });
  }


function editarUsuario(id){
    $.post('php/Administrador/editarUsuario.php', {
        Id_Usuario: id,
        Nombre: document.getElementById("Nombre").value,
        Apellido_P: document.getElementById('Apellido_P').value,
        Apellido_M: document.getElementById('Apellido_M').value,
        Nombre_Usuario: document.getElementById('Nombre_Usuario').value,
        Correo: document.getElementById('Correo').value,
        Roles: document.getElementById('Roles').value,
        Contrasena: document.getElementById('ContrasenaC').value
    })
    .done(function(data){
        let respuesta = document.getElementById('respuesta');
        respuesta.innerHTML=data;
        let Nombre_Usuario = document.getElementById("Nombre_Usuario").value;
        let Contrasena = document.getElementById("Contrasena").value;
        let Correo = document.getElementById("Correo").value;
        let Nombre = document.getElementById("Nombre").value;
        let Apellido_P = document.getElementById("Apellido_P").value;
        let Apellido_M = document.getElementById("Apellido_M").value;
        let User =document.getElementById('Nombre_Usuario');
        let Psswd =document.getElementById('ContrasenaC');
        let email =document.getElementById('Correo');
        let name =document.getElementById('Nombre');
        let lastName =document.getElementById('Apellido_P');
        let secLast =document.getElementById('Apellido_M');
        User.innerHTML = Nombre_Usuario;
        Psswd.innerHTML = Contrasena;

        email.innerHTML = Correo;
        name.innerHTML = Nombre;
        lastName.innerHTML = Apellido_P;
        secLast.innerHTML = Apellido_M;
    });
}

  function cambiarContrasena() {//Funcion asincrona de cambio de contraseña
    $.post('php/Principal/cambiarContrasena.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña
        ContrasenaA: document.getElementById('ContrasenaA').value,
        Contrasena: document.getElementById('Contrasena').value,
      })
      .done(function (data) {
          Materialize.toast(data, 3000, 'rounded');//Genera un toast como respuesta
      });
    }
function infoSolicitud(id){
    $.post('php/Componentes/infoSolicitud.php', {
        Id_Solicitud: id
    })
    .done(function(data){
        console.log(data);
        data=JSON.parse(data);
        let mapa = initMap("mapSolicitud");
        let latitud = data.Latitud;
        let longitud = data.Longitud;
        let NombreProducto = data.NombreProducto;
        let cantidad = data.Cantidad;
        let descripcion = data.Descripcion;
        let fecha = data.Fecha;

        var marker = new google.maps.Marker({
            map: mapa,
            position: new google.maps.LatLng(latitud, longitud),
            label: "Comprador"
        });
        mapa.setCenter(new google.maps.LatLng(latitud, longitud));

            titulo=document.getElementById("tituloInfo");
            cantidadInfo=document.getElementById("cantidadInfo");
            descripcionInfo= document.getElementById("descripcionInfo")
          titulo.innerHTML = NombreProducto;
          descripcionInfo.innerHTML=descripcion;
           cantidadInfo.innerHTML='Cantidad: '+cantidad;

        //  paypal.innerHTML='<a href="php/Biblioteca/modelo.php?id='+Id_Producto+'"class="modal-action modal-close waves-effect waves-green btn-flat blue">Pagar con PayPal</a>';
          id_productoSC.innerHTML = '<a id='+Id_Producto+' class="modal-action modal-close modal-trigger waves-effect green waves-green btn-flat" onClick="solicitudButton(this.id)" href="#modalSolicitud">Solicitar compra</a>';
    });
}
function mandarIdProducto (id){
  $.post('php/Productos/cargamodals.php',{
      Id_Producto: id

  })
.done(function(data){
      //ultimo paso
      data = JSON.parse(data);
      let Nombre_Producto = data.nombre;
      let Descripcion_Producto = data.descripcion;
      let Precio_Producto = data.precio;
      let Id_Producto = data.id;
      let us=data.usuario;
      let imagen = data.imagen;

      let precio = document.getElementById('precioProducto');
      let descripcion = document.getElementById('descripcionProducto');
      let titulo = document.getElementById('tituloform');
      // let paypal = document.getElementById('paypal');
      let rep = document.getElementById('rep');
       let usuario = document.getElementById('usuario');
      let id_productoSC = document.getElementById("SolicitarCompra");
      let id_img = document.getElementById("id_img");
        let id_img3 = document.getElementById("id_img3");

      usuario.innerHTML='<a href="Perfil.php?id='+us+'">'+us+'</a>';
      titulo.innerHTML = Nombre_Producto;
      descripcion.innerHTML=Descripcion_Producto;
       precio.innerHTML='Precio: $'+Precio_Producto;
       rep.innerHTML= '<a href="reportarP.php?id='+Id_Producto+' "class="col 2 waves-effect btn red report"><i class="material-icons">warning</i></a>';
       id_img.innerHTML='<img id="Imagen_Modal"  src="Recursos/'+imagen+'"  height="180px" width="180px">';
       id_img3.innerHTML='<img id="Imagen_Modal"  src="Recursos/'+imagen+'"  height="180px" width="180px">';

      //paypal.innerHTML='<a href="php/Biblioteca/modelo.php?id='+Id_Producto+'"class="modal-action modal-close waves-effect waves-green btn-flat">Pagar con PayPal</a>';
      id_productoSC.innerHTML = '<a id='+Id_Producto+' class="modal-action waves-effect waves-green btn-flat" onClick="solicitarCompraModal(this.id)">Solicitar compra</a>';

    //  paypal.innerHTML='<a href="php/Biblioteca/modelo.php?id='+Id_Producto+'"class="modal-action modal-close waves-effect waves-green btn-flat blue">Pagar con PayPal</a>';
      id_productoSC.innerHTML = '<a id='+Id_Producto+' class="modal-action modal-close modal-trigger waves-effect green waves-green btn-flat" onClick="solicitudButton(this.id)" href="#modalSolicitud">Solicitar compra</a>';

  });
}
function mandarIdCategoria(id){
    $.post('php/Administrador/modalEditarCategoria.php',{
        Id_Categoria:id
    })
    .done(function(data){
        data = JSON.parse(data);
        let nombreCat = document.getElementById("nombreCategoria");
        let desCat = document.getElementById("desCategoria");
        let button = document.getElementById("buttonEditarCategoria");

        nombreCat.innerHTML = '<input id="nombreEditarCate" type="text" class="validate" value="'+data.nombre+'"><label class="active" for="nombreEditarCate">Nombre de Categoria</label>';
        desCat.innerHTML = '<input id="descEditarCategoria" type="text" data-length="140" value="'+data.descripcion+'"><label class="active" for="descEditarCategoria">Descripcion de la Categoria</label>';
        button.innerHTML = '<a id="'+id+'" onclick="editarCategoria(this.id)" class="modal-action modal-close waves-effect waves-green green btn-flat ">Editar</a>'
    })
}
function mandarIdUsuario(id){
    $.post('php/Administrador/modalEditarUsuario.php',{
        Nombre_Usuario: id
    }).done(function(data){
        data = JSON.parse(data);
        let no_modal = document.getElementById("Nombre-modal");
        let ap_modal = document.getElementById("Ap-modal");
        let am_modal = document.getElementById("Am-modal");
        let co_modal = document.getElementById("correo-modal");
        let pssw_modal = document.getElementById("contrasena-modal");
        let rol = document.getElementById("dropdownSelected");
     //dropRoles.innerHTML = dropDownRoles;
     rol.value = data.Id_rol;
     no_modal.innerHTML = '<input id="Nombre" name="Nombre" type="text" class="validate" required value="'+data.Nombre+'"><label class="active" for="Nombre">Nombre</label>';

     ap_modal.innerHTML = '<input id="Apellido_P" name="Apellido_P" type="text" class="validate" required value="'+data.Apellido_P+'"><label class="active" for="Apellido_P">Apellido Paterno</label>';

     am_modal.innerHTML = '<input id="Apellido_M" name="Apellido_M" type="text" class="validate" required value="'+data.Apellido_M+'"><label class="active" for="Apellido_M">Apellido_M</label>';

     co_modal.innerHTML = '<input id="Correo" name="Correo" type="email" class="validate" required value="'+data.Correo+'"><label class="active" for="Correo">Correo</label>';

     pssw_modal.innerHTML = '<input id="ContrasenaE" name="ContrasenaE" type="text"  value="'+data.Contrasena+'"><label class="active" for="Contrasena">Contraseña</label>';

    });
}


function mandarIdProductoEditar (id){
  $.post('php/Productos/cargamodals.php',{
      Id_Producto: id

  })
.done(function(data){
      //ultimo paso
      data = JSON.parse(data);
      var Nombre_Producto = data.nombre;
      var Descripcion_Producto = data.descripcion;
        var Precio_Producto = data.precio;
        var Id_Producto = data.id;
        var Nombre_Usuario=data.usuario;
        var imagen = data.imagen;
      var categoria =data.categoria;
      var precio = document.getElementById('precio');
      var descripcion = document.getElementById('descripcion');
      var titulo = document.getElementById('nombre');
      var id_producto = document.getElementById('id');
      var cat =document.getElementById('cat');
      var usuario = document.getElementById('usu');
      let id_img2 = document.getElementById("id_img2");

      id_img2.innerHTML='<img id="Imagen_Modal"  src="Recursos/'+imagen+'"  height="180px" width="180px">';

      cat.value=categoria;
      titulo.value = Nombre_Producto;
      descripcion.value=Descripcion_Producto;
       precio.value=Precio_Producto;
      id_producto.value=Id_Producto;
        usuario.value=Nombre_Usuario;
       id_producto.href = 'php/Biblioteca/modelo.php?id='+ Id_Producto;

  })

}


function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }

  function cambiarProducto() {//Funcion asincrona de cambio de contraseña
    $.post('php/Productos/editarproductos.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña
        categoria: document.getElementById('cat').value,
        nombre: document.getElementById('nombre').value,
        descripcion: document.getElementById('descripcion').value,
        precio: document.getElementById('precio').value,
         id: document.getElementById('id').value,

      })
      .done(function (data) {
          Materialize.toast("Producto editado", 3000, 'rounded');//Genera un toast como respuesta

        var r1=document.getElementById('respuesta');

        var respuesta = document.getElementById('productos');
          var precio = document.getElementById('precio');
      var descripcion = document.getElementById('descripcion');
      var titulo = document.getElementById('nombre');
 respuesta.innerHTML=data;
      });
    }

    function cambiarProductoPerfil() {//Funcion asincrona de cambio de contraseña
      $.post('php/Productos/editarproductosperfil.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña
          categoria: document.getElementById('cat').value,
          nombre: document.getElementById('nombre').value,
          descripcion: document.getElementById('descripcion').value,
          precio: document.getElementById('precio').value,
           id: document.getElementById('id').value,
      usuario: document.getElementById('usu').value
        })
        .done(function (data) {
            Materialize.toast("Producto editadou", 3000, 'rounded');//Genera un toast como respuesta

          var r1=document.getElementById('respuesta');

          var respuesta = document.getElementById('test1');
            var precio = document.getElementById('precio');
        var descripcion = document.getElementById('descripcion');
        var titulo = document.getElementById('nombre');
   respuesta.innerHTML=data;
        });
      }

function borrarProducto() {//Funcion asincrona de cambio de contraseña
    $.post('php/Productos/borrarProductos.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña
         id: document.getElementById('id').value,
        categoria: document.getElementById('cat').value,

      })
      .done(function (data) {
          Materialize.toast("El producto se ha eliminado", 3000, 'rounded');//Genera un toast como respuesta
   // mostrarProductos(document.getElementById('cat').value);
         var respuesta = document.getElementById('productos');
         respuesta.innerHTML=data;

      });
    }

function borrarProductoPerfil() {//Funcion asincrona de cambio de contraseña
    $.post('php/Productos/borrarProductosPerfil.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña
         id: document.getElementById('id').value,
        usuario: document.getElementById('usu').value,


      })
      .done(function (data) {
        
          Materialize.toast("El producto se ha eliminado", 3000, 'rounded');//Genera un toast como respuesta
                  var respuesta = document.getElementById('test1');
    respuesta.innerHTML=data;

      });
    }

function mostrarAdministrador(id){
    $.post('php/Administrador/mostrarAdministrador.php',{
        id:id
    })
    .done(function(data){
       var contenido = document.getElementById('Contenido');
        contenido.innerHTML=data;
    });
    }

function crearComentario(){
    respuesta = document.getElementById("comentarios");

    $.post('php/Perfil/agregarComentarioPerfil.php', {
        receptor: document.getElementById('UserSide').textContent,
        comentario: document.getElementById('Comentario').value
    })
    .done(function (data) {
        Materialize.toast("se creo el comentario", 3000, 'rounded');//Genera un toast como respuesta
        respuesta.innerHTML = data;
        document.getElementById('Comentario').value = "";
    });
}



$(document).ready(function () {
    /*$('a').click(function(e) {
        
          $('a').removeClass('active');

        var $this = $(this);
        if (!$this.hasClass('active')) {
            $this.addClass('active');
        }
        //e.preventDefault();
    });*/
});

function mostrarProductos(id) {//Funcion asincrona de cambio de contraseña
    $.post('php/Productos/mostrarproductos.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña
         id: id
      })
      .done(function (data) {
     var respuesta = document.getElementById('productos');
        respuesta.innerHTML=data;
      });
    }

function mostrarAdministrador(id){
    $.post('php/Administrador/mostrarAdministrador.php',{
        id:id
    })
    .done(function(data){
       var contenido = document.getElementById('Contenido');
        contenido.innerHTML=data;
    });
}

function eliminarUsuario(id){
    $.post('php/Administrador/eliminarUsuario.php',{
        Nombre_Usuario:id
    })
    .done(function(data){
        mostrarAdministrador("Cuentas");
    });
}

function borrarComentario(id){
    respuesta = document.getElementById("comentarios");
    $.post('php/Perfil/eliminarComentarioPerfil.php', {
        receptor: document.getElementById('UserSide').textContent,
        comentario: id
    })
    .done(function (data) {
        Materialize.toast("se eliminó el comentario", 3000, 'rounded');//Genera un toast como respuesta
        respuesta.innerHTML = data;
    });
}



function solicitarCompra(){
    ubicacion = document.getElementById('ubicaciones');
    id_location=-1;
    lat=-1;
    lng=-1;
    if(ubicacion.value == "UA"){
        lat = map.getCenter().lat();
        lng = map.getCenter().lng();
    }else{
        id_location=ubicacion.value;
    }
    $.post('php/Productos/solicitudCompra.php',{
        Id_Producto: document.getElementById("Id_ProductoSolicitud").value,
        Cantidad: document.getElementById("cantidadSolicitud").value,
        Vendedor: document.getElementById("Id_ProductoSolicitud").value,
        Nombre_Usuario: document.getElementById("VendedorSolicitud").value,
        lat: lat,
        lng: lng,
        idUbicacion: id_location
    })
    .done(function(data){
        Materialize.toast(data, 3000, 'rounded');//Genera un toast como respuesta
    });
  }

    function crearCategoria(){
      $.post('php/Componentes/crearCategoria.php', {//Post a PHP de modificar perfil dando los parametros de Nombre y apellidos
          nomCC: document.getElementById('nomCrearCategoria').value,
          desCC: document.getElementById('desCrearCategoria').value,

        })
        .done(function (data) {

          Materialize.toast(data, 3000, 'rounded');//Genera un toast como respuesta
        });
}
function mostrarProductosGeneral() {//Funcion asincrona de cambio de contraseña
    $.post('php/Productos/mostrarproductosgeneral.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña

      })
      .done(function (data) {
     var respuesta = document.getElementById('productos');
        respuesta.innerHTML=data;
      });
    }

function cargaNotificaciones(){
    $.post('php/Componentes/obtenerNotificaciones.php',{
        switch: "numero"
    })
    .done(function(data){
        if(data != "0"){
            document.getElementById('badage').innerHTML=data;
        }else if(data == "0"){
            document.getElementById('badage').innerHTML="";
        }
    });
}
function cargaMensajesNotif(){
    $.post('php/Componentes/obtenerNotificaciones.php',{
        switch: "mensaje"
    })
    .done(function(data){
        document.getElementById('dropdownNotificaciones').innerHTML=data;
        updateNotif();
    })
}


function buscarProductos() {//Funcion asincrona de cambio de contraseña

    $.post('php/Productos/buscar.php', {//Post a PHP de cambiar contraseña dando los parametros de Contraseña Actual y Nueva Contraseña
      bus: document.getElementById('search_h').value,

      })

      .done(function (data) {
        var busqueda = document.getElementById('mainframe');
        busqueda.innerHTML=data;
      });
    }

function usuarioEditar(){
    $.post('php/Administrador/editUsuario.php',{
        Nombre: document.getElementById("Nombre").value,
        Apellido_M: document.getElementById("Apellido_M").value,
        Apellido_P: document.getElementById("Apellido_P").value,
        Correo: document.getElementById("Correo").value,
        Rol: document.getElementById("dropdownSelected").value,
        Contrasena: document.getElementById("ContrasenaE").value
    })
    .done(function(data){
        mostrarAdministrador("Cuentas");
    })
}

function editarCategoria(id){
    $.post('php/Administrador/editarCategoria.php',{
        Nombre: document.getElementById("nombreEditarCate").value,
        Descripcion: document.getElementById("descEditarCategoria").value,
        Id_Categoria: id
    })
    .done(function(data){
        mostrarAdministrador("Categorias");
    })
}

var map;
function solicitudButton(id){
    $.post('php/Productos/cargamodals.php',{
        Id_Producto:id
    })
    .done(function(data){
        data = JSON.parse(data);
        document.getElementById("inputCantidad").innerHTML='<input id="cantidadSolicitud" type="number" min="1" value="1" oninput="precioCambio('+data.precio+',this.value)" required><label for="cantidadSolicitud" class="active">Cantidad</label>';
        //document.getElementById("mapContainer").innerHTML='<div id="map"></div>'
        map = initMap('map');
        let descripcion = document.getElementById("descripcionProductoSolicitud");
        let titulo = document.getElementById("tituloformSolicitud");
        let precio = document.getElementById("precioProductoSolicitud");
        let Id_Producto = document.getElementById("Id_ProductoSolicitud");
        let vendedor = document.getElementById("VendedorSolicitud");
        let reportar = document.getElementById("rep");
        let button = document.getElementById("SolicitarCompraSolicitud");
        let id_img3 = document.getElementById("id_img3");
        id_img3.innerHTML='<img id="Imagen_Modal"  src="Recursos/'+data.imagen+'"  height="180px" width="180px">';


        titulo.innerHTML = data.nombre;
        vendedor.value = data.usuario;
        Id_Producto.value = data.id;
        descripcion.innerHTML = data.descripcion;
        precio.innerHTML = 'Precio: $'+data.precio;
        reportar.innerHTML = '<a href="reportarP.php?id='+Id_Producto+' "class="col 2 waves-effect btn red report"><i class="material-icons">warning</i></a>';
        button.innerHTML =  '<a onclick="solicitarCompra()" class="modal-action modal-close waves-effect waves-green btn-flat green">Listo</a>';

    });
}


function precioCambio(precio,cantidad){
    let total = precio*cantidad;
    total = total.toFixed(2);
    document.getElementById("precioProductoSolicitud").innerHTML = 'Precio: $'+total;
}

function updateNotif(){
    $.post('php/Componentes/updateNotif.php',{

    })
    .done(function(data){
    });
}

function aceptarSolicitud(id_solicitud){
    $.post('php/Componentes/aceptarSolicitud.php',{
        Id_solicitud:id_solicitud
    })
    .done(function(data){

    });
}
function cancelarSolicitud(id_solicitud){
    $.post('php/Componentes/valueSolicitud.php',{
        Id_solicitud:id_solicitud
    })
    .done(function(data){

    });
}
function crearProducto(){
        $.post('php/Componentes/crearProducto.php', {//Post a PHP de modificar perfil dando los parametros de Nombre y apellidos
            nomCP: document.getElementById('nomCrearProducto').value,
            desCP: document.getElementById('desCrearProducto').value,
            cosCP: document.getElementById('cosCrearProducto').value,

           carCP: document.getElementById('catCrearProducto').value
          })
          .done(function (data) {

            Materialize.toast(data, 3000, 'rounded');//Genera un toast como respuesta
          });
      }

var sessionVar;
function getSession(){
    var response;
    $.get('php/Componentes/session.php',{

    })
    .done(function(data){
        setSessionVar(data);
    });
    return sessionVar;
}
var pageVar;
function getPageName(){
    var response;
    $.get('php/Componentes/pageName.php',{

    })
    .done(function(data){
        setPageName(data);
    });
    return pageVar;
}

function setPageName(response){
    pageVar=response;
}
function setSessionVar(response){
    sessionVar=response;
}
function refrescarProductos(){
  $.post('php/Principal/ultimosProductos.php', {//Post a PHP de modificar perfil dando los parametros de Nombre y apellidos

    })
    .done(function (data) {
      var div = document.getElementById('productos');
      div.innerHTML=data;

    });
}
