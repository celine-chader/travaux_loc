import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  static targets = ["mapElement", "toggableElement"]

  fire() {
    this.mapElementTarget.classList.toggle("d-none");
    mapboxgl.accessToken = 'pk.eyJ1IjoiZW1ldTkyMjcwIiwiYSI6ImNsaG9udjI5MzFtNjkza3MxYTVhZmNlbG0ifQ.T06ttUogvxWXwfDNVI1bqA'

    this.map = new mapboxgl.Map({
      container: this.mapElementTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  };

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  };

}
