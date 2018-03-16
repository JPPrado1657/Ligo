
<?php
  header('Content-type: text/css; charset:UTF-8');

?>
#mapSolicitud{
    height: 500px;
}
#map{
    height: 500px;
}
input#search_h {
    color: black;
}

body {
  display: flex;
  min-height: 100vh;
  flex-direction: column;
}

main {
  flex: 1 0 auto;
}

.quick-btn {
  position: relative;
  color: #444444;
  text-align: center;
}
.quick-btn .label {
  position: relative;
  top: -10px;
  right: -2px;
  display: inline-block;
  min-width: 10px;
  padding: 3px 7px;
  font-size: 12px;
  font-weight: bold;
  line-height: 1;
  color: #fff;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  background-color: red;
  border-radius: 10px;
}
.quick-btn .label:empty{
    display: none;
}


.notificacionesCheck{
  width: 24px;
  height: 20px;
  position: relative;
  right: -.5em;
}

.notifIconCheck{
    position: relative;
    top: -1.5em;
    right: .4em;
    color: green !important;
}
.notificacionesCheck:hover{
    border-radius: 15px;
    background-color: green;
}
.notificacionesCheck:hover .notifIconCheck{
    color: white !important;
}

.notificacionesTimes{
  width: 24px;
  height: 20px;
  position: relative;
  right: -.5em;
}

.notifIconTimes{
    position: relative;
    top: -1.5em;
    right: .4em;
    color: red !important;
}
.notificacionesTimes:hover{
    border-radius: 15px;
    background-color: red;
}
.notificacionesTimes:hover .notifIconTimes{
    color: white !important;
}

#logo-container{
    margin-left: -4em;
}
.right.hide-on-med-and-down{
    margin-right: -9em;
}

#search_h{

    height: 1.7rem !important;

    padding: 2px;
    width: calc(100% - 4rem);
    border: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
     border: 1px solid lightgrey;
     border-radius: 10px;
     margin-top: 10px;
     margin-right: 20rem;

}

.btnpro{
  border-radius: 0px !important;
  text-align: center;
  color: white;

}

#cardProd{
  border-bottom-left-radius: 0px !important;
  border-bottom-right-radius: 0px !important;

}
.btnlft{
  border-bottom-left-radius: 2px !important;
}
.btnrght{
  border-bottom-right-radius: 2px !important;
}


#navMainText{
  color: grey;
  z-index: 100;
}



#destacados{

    margin-bottom: 1em;
    margin-top: 2em;
}
#modal1{
    width: 30%;
}
#modal2{
    height: 100%;
}

.navegacion{
    background-color: white;
    height:-1em;
    box-shadow: 0px 0px 2px grey;
    z-index: 1;

}

.parallax-container{
    width: 100% !important;
}

.page-footer{
    background-color: #0D1D34;
}
#modal3{
   height: 55%;
}
#modalcontent3{
      height: 100%;
    margin: auto;
}
.card-image{
    height: 30% !important;
}
.card{
    max-width: 100% !important;
    max-height: 100% !important;
}


#imagencarta{

  object-fit: cover;

  }

.collection{
    position: fixed;
    width:16%;


}
#side1{
    padding:0px;
}
.compra{
    background-color: #6484B7;
    width:100%;
    height: 100%;
}
.compra:hover{
    background-color: #56729B;
}
.card-action{
    padding: 0px !important;
    width:100%;
    height: 100%;
}

#tituloform{
    margin: 5px !important;
}
.error{
  font-size: 0.8em;
  color: rgb(184, 14, 14);
}
#imagenDiv{
  height: 65px;
  margin-left: -0.5em;

}
#notifDiv{
    height: 65px;
}
#iconNotif{
    max-height: 20%;
}
#imagenLogo{
max-height: 70%;
margin-top: 8px;
margin-left: 12px;

}

#carim1{
  width: 100%;
    height: 120px;
    background-image: url("../../Recursos/first.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    position: fixed;

}
#carim2{
  width: 100%;
    height: 120px;
    background-image: url("../../Recursos/second.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    position: fixed;

}
#carim3{
  width: 100%;
    height: 120px;
    background-image: url("../../Recursos/third.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    position: fixed;

}
#carim4{
  width: 100%;
    height: 120px;
    background-image: url("../../Recursos/fourth.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    position: fixed;

}

#try1{
  color: black;
  display: block;
  padding: 8px 8px 8px 72px;
  width: 87%;
  background: rgba(255, 255, 255, 0.3);
  height: 24px;


  border: none;
  font-size: 16px;
  appearance: textfield;
  font-weight: 400;
  outline: none;


}
#row{

  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
}
#buttonAdmin{
  margin:10px;
}
.card .card-action a:not(.btn):not(.btn-large):not(.btn-large):not(.btn-floating) {
  color: white !important;

  background-position: center;
  margin-left: 0em;
}
.cat{
  margin-top: 3em;
}
.collection a.collection-item{
  color:black;
  cursor: pointer;
}
*:focus {
    outline: !important;
}

.card .card-action a:not(.btn):not(.btn-large):not(.btn-large):not(.btn-floating){
  margin-right: 0;
}

.card.hoverable {
    margin-top: 2em;
        margin-left: 2em;

}
.mod,.camb,.del{
  margin-left: 2em;
  color: white!important;

}
.bnav{
  margin-top:1em;
}
input[type=search]:not(.browser-default),{
  outline:inherit;
}

.title{
  margin-left: 18%;
  padding-bottom: 1.5em;
  padding-top: 1.5em;
}
.btn-flat{
  color: white;
}
#iconNotif{
  color: grey;
  font-size: 1.2em;
}
#badage{
  font-family : Roboto;
}
.binicio{
  border-radius: 2px;!important
}
#cancelarI{
  padding-left: 1.5em;
  padding-rigth: 1.5em;
}
#inicioI{
  padding-left: 1.5em;!important
  padding-rigth: 1.5em;!important
}
#h2busqueda{
  padding-left: 1em;
  font-size: 1.8em;

}
#dropdownMod li{
  color: black;!important
}
.camb{
color:black;!important
}
#perfilInfo{
margin-top: 1em;!important
}
.set{
  color:black;!important
}
#labelset{
  margin-top: 2em;

}
#configDrop{
  padding-left: 4em;
  cursor: pointer;
}
#infoS{
  margin-bottom: -1em;
}
.collection .collection-item.active {
  background-color: #2196F3;
  color: #eafaf9;
}
#lastP{
  margin-top: 2em;
  margin-left: 1em;
}
#reportarUsu{
  cursor: pointer;
}
#reportIcon{
  color: red;
}
#settingsIcon{
  color: #2196F3;
}
#dropdownNotificaciones li{
  padding-left: 1em;
  padding-right: 1em;
}
