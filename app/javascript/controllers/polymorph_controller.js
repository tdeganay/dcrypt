import { Controller } from "stimulus";
import Sortable from "sortablejs";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['block'];

  connect() {
    console.log('coucou')
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }
  end(event) {
    console.log(event)
    console.log(this.blockTargets)
    var chart = Chartkick.charts["chart-1"]
    chart.redraw()
    console.log(chart)
    const positions = this.blockTargets.map((block, index) => {
    return {index: index + 1,
            position:block.dataset.positionId}
    });
    console.log(positions)
    // retrouver touts les id des potions en db
    let id = event.item.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)
    console.log(this.data.get("url"))
    fetch(`${this.data.get("url")}?position_id=${event.item.dataset.positionId}&new_number=${event.newIndex + 1}`,{
      method: 'PATCH',
      data: data,
      headers:  {"X-CSRF-Token": csrfToken()},
      body: JSON.stringify(positions)
    }).then(response => response.json()).then((data) => console.log(data))
  }
}
