import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="product-create"
export default class extends Controller {
  static targets = ["textField"]

  change(event) {
    const checkbox = event.currentTarget
    const shouldShowTextField = checkbox.checked

    this.textFieldTarget.hidden = !shouldShowTextField
  }
}
