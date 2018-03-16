function log() {
  $('.small.modal')
    .modal({
      blurring: true
    })
    .modal('show');
}

function sign() {
  $('.ui.modal.register')
    .modal({
      blurring: true
    })
    .modal('show');
}
function sideBar(){
  $('.ui.sidebar')
    .sidebar('toggle')
  ;
}


var buttons = document.querySelectorAll('.log');
for (var i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener("click",function(btn){
    log();

  });
}
var buttons = document.querySelectorAll('.sign');
for (var i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener("click",function(btn){
    sign();

  });
}


document.querySelector('#sideBar').addEventListener("click", function(btn) {
  sideBar();

});

// document.querySelector('#bLog').addEventListener("click", function(btn) {
//   sideBar();
//
// });
// document.querySelector('#bReg').addEventListener("click", function(btn) {
//   sideBar();
//
// });
