import mapboxgl from 'mapbox-gl';


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 10 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const markers = JSON.parse(mapElement.dataset.markers);

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/navigation-guidance-night-v4'
    });

    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
    });
    fitMapToMarkers(map, markers);
  }
};



export { initMapbox };
