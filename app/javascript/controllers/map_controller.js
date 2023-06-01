import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    marker: Object
  }
  static targets = ["mapElement", "toggableElement", "mapShowElement"]

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoiZW1ldTkyMjcwIiwiYSI6ImNsaG9udjI5MzFtNjkza3MxYTVhZmNlbG0ifQ.T06ttUogvxWXwfDNVI1bqA'
    console.log(this.markerValue.lat)
    this.map = new mapboxgl.Map({
      container: this.mapShowElementTarget,
      style: "mapbox://styles/mapbox/streets-v11"
    })


      new mapboxgl.Marker()
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .addTo(this.map)

    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  fire() {
    this.mapElementTarget.classList.toggle("d-none");
    mapboxgl.accessToken = 'pk.eyJ1IjoiZW1ldTkyMjcwIiwiYSI6ImNsaG9udjI5MzFtNjkza3MxYTVhZmNlbG0ifQ.T06ttUogvxWXwfDNVI1bqA'

    this.map = new mapboxgl.Map({
      container: this.mapElementTarget,
      style: "mapbox://styles/mapbox/streets-v11"
    })
    console.log(this.markersValue)
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });

    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


}
