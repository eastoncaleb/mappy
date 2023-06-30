import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['map']

  connect() {
    const id = this.element.dataset.id;
    window.initMap = this.initMap.bind(this);
    this.fetchAddresses(id);
  }

  fetchAddresses(id) {
    fetch(`/searches/${id}.json`)
      .then(response => response.json())
      .then(data => {
        if (Array.isArray(data) && data.length == 2) {
          const [startAddress, endAddress] = data;
          this.origin = startAddress;
          this.destination = endAddress;
          this.initMap();
        }
      })
      .catch(error => console.error('Failed to fetch addresses:', error));
  }

  initMap() {
    if (this.origin == undefined || this.destination == undefined || !this.hasMapTarget) return;

    const directionsService = new google.maps.DirectionsService();
    const directionsRenderer = new google.maps.DirectionsRenderer();
    const map = new google.maps.Map(this.mapTarget, {
      zoom: 7,
      center: { lat: 41.85, lng: -87.65 },
    });
   
    directionsRenderer.setMap(map);

    this.calculateAndDisplayRoute(directionsService, directionsRenderer);
  }
  
  calculateAndDisplayRoute(directionsService, directionsRenderer) {
    directionsService
      .route({
        origin: {
          query: this.origin,
        },
        destination: {
          query: this.destination,
        },
        travelMode: google.maps.TravelMode.DRIVING,
      })
      .then((response) => {
        directionsRenderer.setDirections(response);
      })
      .catch((e) => console.error("Request failed due to " + e.status));
  }
}
