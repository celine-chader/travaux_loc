import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]
  connect() {
    flatpickr(this.startTimeTarget, {
              enableTime: false,
              mode: "range",
              inline: true,
              // Provide an id for the plugin to work
              plugins: [new rangePlugin({ input: this.endTimeTarget})]})
  }
}
