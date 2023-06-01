import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-category"
export default class extends Controller {
  connect() {
    console.log("hello");
  }
}
