import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["sidebar"]
  connect() {
    console.log("Hello from your first Stimulus controller")
  }
  close(event) {
    console.log(event)
    this.sidebarTargets.forEach((sidebar) => {
      sidebar.classList.toggle("d-none")
    })
  }
}
