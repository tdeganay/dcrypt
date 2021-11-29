import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['block'];

  connect() {
    console.log('coucou')
    // console.log(this.element);
    // console.log(this.itemsTarget);
    // console.log(this.blockTarget);

    fetch(this.blockTarget.dataset.fetchUrl, {
      method: 'GET',
      headers: { 'Accept': "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.blockTarget.outerHTML = data.block;
      });

    // add interval
  }
}
