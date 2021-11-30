import { Controller } from "stimulus";
import Sortable from "sortablejs";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {

  connect() {
    console.log('coucou')
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    console.log(event)
    // retrouver touts les id des potions en db
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)
    console.log(this.data.get("url"))
    fetch(this.data.get("url"),{
      method: 'PATCH',
      data: data,
      headers:  {"X-CSRF-Token": csrfToken()},
    })
  }
}
