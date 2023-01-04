import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["timeline", "analysis"]

  showTimeline() {
    this.timelineTarget.style.display = "block"
    this.analysisTarget.style.display = "none"
  }

  showAnalysis() {
    this.timelineTarget.style.display = "none"
    this.analysisTarget.style.display = "block"
  }
}
