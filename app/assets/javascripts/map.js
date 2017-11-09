var map = L.map('map',{
    zoomSnap: .1,
    zoomDelta: .1,
    center: [40, 10],
    zoom: 2.0,
    maxBounds: ([[-65, -180], [90, 190]]),
    // scrollWheelZoom: false
  });
  
  map.setMinZoom(2.1)
  map.fitBounds([[-65, -180], [90, 190]]);
//   map.scrollWheelZoom.disable();

  var defaultStyle = {
    "color": "#000000",
    "weight": 0.1,
    "opacity": 0.5,
    "fill": true,
    "fillColor": "#000000",
    "fillOpacity": 0.01,
  };
  
  var hoverStyle = {
    "color": "#FF0000",
    "weight": 0.5,
    "opacity": 0.5,
    "fill": true,
    "fillColor": "#c74360",
    "fillOpacity": 0.5, 
  };
  
  var selectStyle = {
    "color": "#0000FF",
    "weight": 0.2,
    "opacity": 1,
    "fill": true,
    "fillColor": "#0000FF",
    "fillOpacity": 0.1,
  };
  
  L.tileLayer('https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>, &copy; <a href="https://carto.com/attribution">CARTO</a>'
  }).addTo(map);
  
  var gj01='nations.geojson';   
  var nations;
  
  $.getJSON(gj01, function(data) {
      nations = L.geoJson(data, {
          style: defaultStyle,
          onEachFeature: selectFeatures
      });
      map.addLayer(nations);
  });
  
  function selectFeatures(feature, layer) {
  
  
    layer.on('mouseover',function(){
      layer.setStyle(hoverStyle);
    })
  
    layer.on('mouseout',function(){
      layer.setStyle(defaultStyle);
    })
  
      layer.on('click',function(){
      if(feature.properties.country_id!=null){
        url='countries/'+feature.properties.country_id;
        window.open(url,"_self")
      }

      });
  
  };
  