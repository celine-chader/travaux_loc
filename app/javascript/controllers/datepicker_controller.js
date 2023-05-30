import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  connect() {
    flatpickr(this.startDateInputTarget, {
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    })
  }
}
