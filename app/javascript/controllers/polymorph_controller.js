import { Controller } from "stimulus";
import Sortable from "sortablejs";

export default class extends Controller {

  connect() {
    console.log('coucou')
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)

    Rails.ajax({
      url: this.data.get("url").remplace(":id", id),
      type: 'PATCH',
      data: data
    })
  }
}
