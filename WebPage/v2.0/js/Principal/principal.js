var time = 100;
 $(document).ready(function() {
  setInterval(cargaNotif,time);
  //setInterval(refrescarProd,1000);
  $('.dropdown-button').dropdown({//Caracteristicas del dropdown i su funcionamiento
      inDuration: 300,
      outDuration: 225,
      constrainWidth: false, // Does not change width of dropdown to that of the activator
      gutter: 0, // Spacing from edge
      belowOrigin: true, // Displays dropdown below the button
      alignment: 'left', // Displays dropdown with edge aligned to the left of button
      stopPropagation: false // Stops event propagation
    }
  );
  $('.dropdown-button2').dropdown({//Caracteristicas del dropdown i su funcionamiento
      inDuration: 300,
      outDuration: 225,
      constrainWidth: false, // Does not change width of dropdown to that of the activator
      gutter: 0, // Spacing from edge
      belowOrigin: true, // Displays dropdown below the button
      alignment: 'right', // Displays dropdown with edge aligned to the left of button
      stopPropagation: false // Stops event propagation
    }
  );
  $("#dropdownMod").dropdown();//Da la funcionalidad del dropdown

   // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
   $('#modalMasterPro').modal();
    $('#modal1').modal();//Permite el mostrar los modals
   $('.carousel.carousel-slider').carousel({//Permite hacer responsivo el carusel
     fullWidth: true

   });
 autoplay();
 function autoplay() {
     $('.carousel').carousel('next');
     setTimeout(autoplay, 5000);
 }
   $('#modalEditarCategoria').modal();
   $('#modalSolicitud').modal();
   $('#modal2').modal();//Permite el mostrar los modals
   $('#modal3').modal();//Permite el mostrar los modals
   $("#iconito").dropdown();//Da la funcionalidad del dropdown
   $('#modal4').modal();//Permite el mostrar los modals
   $('#editarU').modal();//Permite el mostrar los modals
   $('#solicitudCompra').modal();//Permite el mostrar los modals
   $('#modificarPerfil').modal();//Permite el mostrar los modals
   $('#cambiarContrasena').modal();//Permite el mostrar los modals
   $('select').material_select();//Da la funcionalidad al select
   $('#modalCrearProducto').modal();//Permite el mostrar los modal de crear producto
   $('#modalCrearCategoria1').modal();//Permite el mostrar los modal de crear producto
   $('#modalComentario').modal();
   $('#modalCrearPromo').modal();

   $.extend($.validator.messages, {// Extensor de mensajes al idioma español para dar retroalimentacion en forms
     required: "Este campo es obligatorio.",
     remote: "Por favor, rellena este campo.",
     email: "Por favor, escribe una dirección de correo válida.",
     url: "Por favor, escribe una URL válida.",
     date: "Por favor, escribe una fecha válida.",
     dateISO: "Por favor, escribe una fecha (ISO) válida.",
     number: "Por favor, escribe un número válido.",
     digits: "Por favor, escribe sólo dígitos.",
     creditcard: "Por favor, escribe un número de tarjeta válido.",
     equalTo: "Por favor, escribe el mismo valor de nuevo.",
     extension: "Por favor, escribe un valor con una extensión aceptada.",
     maxlength: $.validator.format("Por favor, no escribas más de {0} caracteres."),
     minlength: $.validator.format("Por favor, no escribas menos de {0} caracteres."),
     rangelength: $.validator.format("Por favor, escribe un valor entre {0} y {1} caracteres."),
     range: $.validator.format("Por favor, escribe un valor entre {0} y {1}."),
     max: $.validator.format("Por favor, escribe un valor menor o igual a {0}."),
     min: $.validator.format("Por favor, escribe un valor mayor o igual a {0}."),
     nifES: "Por favor, escribe un NIF válido.",
     nieES: "Por favor, escribe un NIE válido.",
     cifES: "Por favor, escribe un CIF válido."
   });
   $("#registro").validate({//Validacion de form Registro
     rules: {//Reglas que s eaplican a los inputs mencioandos por id
       Nombre: {
         required: true,
         minlength: 2
       },
       Apellido_M: {
         required: true,
         minlength: 2
       },
       Apellido_P: {
         required: true,
         minlength: 2
       },
       Correo: {
         required: true,
         email: true
       },
       Nombre_Usuario: {
         required: true,
         minlength: 5

       },
       Contrasena: {
         required: true,
         minlength: 5,
         equalTo: "#ContrasenaC"
       },
       ContrasenaC: {
         required: true,

       },


       Año_Ing: "required",
       Semestre: "required",
     },
     //For custom messages
     messages: {//Mensajes personalizados para los inputs mencionados
       Nombre_Usuario: {
         required: "Inserta un Nombre de Usuario",
       },
       Nombre_Usuario: {
         required: "No debe de contener caracteres especiales",
       }

     },
     errorElement: 'div',//Respuesta del error o violacion en HTML
     errorPlacement: function(error, element) {
       var placement = $(element).data('error');
       if (placement) {
         $(placement).append(error)
       } else {
         error.insertAfter(element);
       }
     }
   });

   //MIsma funcionalidad que registro
   $("#sesionarse").validate({
     rules: {

       Nombre_Usuario: {
         required: true,


       },
       Contrasena: {
         required: true,

       },

     },
     //For custom messages
     messages: {
       Nombre_Usuario: {
         required: "Inserta tu Nombre de Usuario",
       },
       Contrasena: {
         required: "Inserta tu Contraseña",
       }

     },
     errorElement: 'div',
     errorPlacement: function(error, element) {
       var placement = $(element).data('error');
       if (placement) {
         $(placement).append(error)
       } else {
         error.insertAfter(element);
       }
     }
   });
//MIsma funcionalidad que registro
   $("#cambiarC").validate({
     rules: {

       ContrasenaA: {
         required: true,


       },
       Contrasena: {
         required: true,

       },

     },
     //For custom messages
     messages: {
       ContrasenaA: {
         required: "Ingresa tu contraseña actual",
       },
       Contrasena: {
         required: "Inserta tu nueva contraseña",
       }

     },
     errorElement: 'div',
     errorPlacement: function(error, element) {
       var placement = $(element).data('error');
       if (placement) {
         $(placement).append(error)
       } else {
         error.insertAfter(element);
       }
     }
   });



 });
 function getID(id){
     let nu_modal = document.getElementById("Nu-modal");
     let nu_id = "Nu"+id;
     console.log(nu_id);
     /**/
     let no_modal = document.getElementById("Nombre-modal");
     let no_id = "No"+id;
     /**/
     let ap_modal = document.getElementById("Ap-modal");
     let ap_id = "Ap"+id;
     /**/
     let am_modal = document.getElementById("Am-modal");
     let am_id = "Am"+id;
     /**/
     let co_modal = document.getElementById("correo-modal");
     let co_id = "Co"+id;
     /**/
     let pssw_modal = document.getElementById("contrasena-modal");
     let pssw_id = "Pssw"+id;
     /**/
     let id_modal = document.getElementById("id-modal");
     /**/
     nu_modal.innerHTML = '<input id="Nombre_Usuario" name="Nombre_Usuario" type="text" class="validate" required value="'+document.getElementById(nu_id).innerHTML+'"><label class="active" for="Nombre_Usuario">Username</label>';

     no_modal.innerHTML = '<input id="Nombre" name="Nombre" type="text" class="validate" required value="'+document.getElementById(no_id).innerHTML+'"><label class="active" for="Nombre">Nombre</label>';

     ap_modal.innerHTML = '<input id="Apellido_P" name="Apellido_P" type="text" class="validate" required value="'+document.getElementById(ap_id).innerHTML+'"><label class="active" for="Apellido_P">Apellido Paterno</label>';

     am_modal.innerHTML = '<input id="Apellido_M" name="Apellido_M" type="text" class="validate" required value="'+document.getElementById(am_id).innerHTML+'"><label class="active" for="Apellido_M">Apellido_M</label>';

     co_modal.innerHTML = '<input id="Correo" name="Correo" type="email" class="validate" required value="'+document.getElementById(co_id).innerHTML+'"><label class="active" for="Correo">Correo</label>';

     pssw_modal.innerHTML = '<input id="ContrasenaE" name="ContrasenaE" type="text"  value="'+document.getElementById(pssw_id).innerHTML+'"><label class="active" for="Contrasena">Contraseña</label>';

     id_modal.innerHTML = '<input class="validate" name="Id_Usuario" type="hidden" required value="'+id+'">';

     /*let descripcion_modal = document.getElementById("descripcion-modal");
     let desc_id = "d"+id;
     let precio_modal = document.getElementById("precio-modal");
     let id_modal = document.getElementById("id-modal");
     console.log(precio_modal);
     let pre_id = "p"+id;

     descripcion_modal.innerHTML = '<div class="col-sm-12"><input type="text" class="validate" name="Descripcion" required value="'+document.getElementById(desc_id).innerHTML+'"></div>';

     precio_modal.innerHTML = '<div class="col-sm-12"><input type="text" class="validate" name="Precio" required value="'+document.getElementById(pre_id).innerHTML+'"></div>  <div class="row"><?php getDropdownMats("Materiales","precio",$registro["desc"])?></div>';

     id_modal.innerHTML = '<div class="col-sm-12"><input class="validate" name="id" type="hidden" required value="'+id+'"></div>';*/

     return id;
 }


 function mostrarCat(id){
     let Cat_Id = document.getElementById("aqui");
     Cat_Id.innerHTML="<?php getProductos(+id+´´); ?>";
 }

function idRol(id){
    let aux;
    switch(id){
        case "1":
            aux = "GrupoEstudiantil";
            break;
        case "2":
            aux = "UsuarioGenerico";
            break;
        case "3":
            aux = "Administrador";
            break;
        case "4":
            aux = "Usuario registrado";
            break;
        case "5":
            aux = "Super Usuario";
            break;
    }
    return aux;
}
var i=50;
function cargaNotif(){
      let sessName = getSession();
      if(sessName!="F"){
          cargaNotificaciones();
      }
      i++;
      if(i>50){
        refrescarProd();
      }
  }
function refrescarProd(){
  let pageName = getPageName();
  if(pageName=="index" || pageName=="indexR"){

    refrescarProductos();
  }
}
