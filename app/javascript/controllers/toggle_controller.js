import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "modal"];

  static values = {isOpen: {type: Boolean, default: false}};

  connect() {
    // console.log("Connected");
  };

  static targets = ["ariaExpander"];

  toggle(event) {
    const expandedPresent = this.element.classList.contains("expanded");
    this.element.classList.toggle("expanded", !expandedPresent);

    this.ariaExpanderTargets.forEach((el) => {
      el.setAttribute("aria-expanded", expandedPresent);
    });

  }

  closeOnEscape(event) {
    if (event.key === "Escape") {
      if (this.element.classList.contains("expanded")) {
        this.toggle(event);
      }
    }
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    // Remove src reference from parent frame element
    // Without this, turbo won't re-open the modal on subsequent click
    this.modalTarget.remove()
  }

  // hide modal when clicking ESC
  // action: "keyup@window->turbo-modal#closeWithKeyboard"
  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  // hide modal when clicking outside of modal
  // action: "click@window->turbo-modal#closeBackground"
  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return
    }
    this.hideModal()
  }
};
