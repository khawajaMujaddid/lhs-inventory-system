import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sub-category"
export default class extends Controller {

  updateCategories(event) {
    const value = event.target.value;
    const url = event.target.dataset.url;
    const turboType = event.target.dataset.turboType;
    this.url = (`${url}?id=${value}`)

    let frame = document.querySelector(`turbo-frame#${turboType}`)
    frame.src = this.url
    frame.reload()
  }
}
