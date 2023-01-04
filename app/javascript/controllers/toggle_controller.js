import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "ariaExpander", "popup"]

  toggle(event) {
    const expandedPresent = this.element.classList.contains("expanded")
    this.element.classList.toggle("expanded", !expandedPresent)

    this.ariaExpanderTargets.forEach(el => {
      el.setAttribute("aria-expanded", expandedPresent)
    })
  }

  closeOnEscape(event) {
    if (event.key === "Escape") {
      if (this.element.classList.contains("expanded")) {
        this.toggle(event)
      }
    }
  }

  connect() {
    document.addEventListener("click", this.onClick.bind(this))
  }

  onClick(event) {
    if (this.popupTargets && this.popupTargets.length > 0 && this.popupClose) {
      // the popup element has the data-toggle-close attribute
      if (!this.popupTargets[0].contains(event.target)) {
        // the target of the click event is outside the popup element
        this.toggleClose()
      }
    }
  }

  toggleClose() {
    if (this.popupTargets) {
      this.popupTargets.forEach(element => {
        element.classList.toggle("show")
      })
    }
  }

  get popupClose() {
    return this.popupTargets[0].getAttribute("data-toggle-close") === "true"
  }
};
