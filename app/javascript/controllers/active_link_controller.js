import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = [ "link" ]

  connect() {
    this.linkTargets.forEach(link => {
      link.addEventListener("click", event => {
        event.preventDefault()
        this.activateLink(link)
      })
    })
  }

  activateLink(link) {
    this.linkTargets.forEach(link => link.classList.remove("active"))
    link.classList.add("active")
  }
}
