
function config(){
  $('#configM')
  .modal('show')
;
}








var buttons = document.querySelectorAll('.open');
for (var i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener("click",function(btn){
    config();

  });
}
