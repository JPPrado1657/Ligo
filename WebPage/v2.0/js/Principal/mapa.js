function initMap(id) {
//console.log(document.getElementById('map').innerHTML);
//document.getElementById('map').innerHTML = "asdasdasd";
console.log(id);
var map = new google.maps.Map(document.getElementById(id), {
  center: new google.maps.LatLng(20.613815, -100.405174),
  zoom: 17
});
var infoWindow = new google.maps.InfoWindow({map: map});
//geolocation
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
    var pos = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };

    console.log(pos.lat);
    console.log(pos.lng);
    infoWindow.setPosition(pos);
    infoWindow.setContent('Location found.');
    map.setCenter(pos);
  }, function() {
    handleLocationError(true, infoWindow, map.getCenter());
  });
} else {
  // Browser doesn't support Geolocation
  handleLocationError(false, infoWindow, map.getCenter());
}

  // Change this depending on the name of your PHP or XML file
  downloadUrl('php/Biblioteca/mapa.php', function(data) {
    var xml = data.responseXML;
    //Materialize.toast(xml, 3000, 'rounded');
    var markers = xml.documentElement.getElementsByTagName('marker');
    Array.prototype.forEach.call(markers, function(markerElem) {
      var name = markerElem.getAttribute('name');
      var address = markerElem.getAttribute('address');
      var type = markerElem.getAttribute('type');
      var point = new google.maps.LatLng(
          parseFloat(markerElem.getAttribute('lat')),
          parseFloat(markerElem.getAttribute('lng')));

      var infowincontent = document.createElement('div');
      var strong = document.createElement('strong');
      strong.textContent = name
      infowincontent.appendChild(strong);
      infowincontent.appendChild(document.createElement('br'));

      var text = document.createElement('text');
      text.textContent = address
      infowincontent.appendChild(text);
      var icon = customLabel[type] || {};
      var marker = new google.maps.Marker({
        map: map,
        position: point,
        label: icon.label
      });
        
        var markerCenter = new google.maps.Marker({
            map: map,
            position: map.getCenter(),
            label: "Solicitar Producto aquí"
        });
        map.addListener('center_changed', function(){
            markerCenter.setPosition(map.getCenter());
        });
      marker.addListener('click', function() {
        infoWindow.setContent(infowincontent);
        infoWindow.open(map, marker);
      });
    });
  });

  // Try HTML5 geolocation.
    return map;
}
