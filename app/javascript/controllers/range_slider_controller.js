import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['value'];

  connect() {
    this.valueTarget.textContent = this.element.value;
  }

  change(event) {
    this.valueTarget.textContent = event.currentTarget.value;
  }
}