import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    console.log(1)
  }
  setT() {
    this.element.textContent = 'Hello World!'
  }
}
