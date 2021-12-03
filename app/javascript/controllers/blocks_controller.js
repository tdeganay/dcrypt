import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['block', 'layout'];

  connect() {
    console.log('coucou')
    // console.log(this.element);
    // console.log(this.itemsTarget);
    // console.log(this.blockTarget);

    if (this.blockTarget) {
      fetch(this.blockTarget.dataset.fetchUrl, {
        method: 'GET',
        headers: { 'Accept': "application/json" }
      })
        .then(response => response.json())
        .then((data) => {
          console.log(data)
          this.blockTarget.outerHTML = data.block;
        });
    }


    // add interval
  }

  inject(event) {
    event.preventDefault()
    console.log(this)
    console.log('hello')
    console.log(event)
    console.log(event.currentTarget.href)
    fetch(event.currentTarget.href, {
      method: 'GET',
      headers: { 'Accept': "application/json" }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this.layoutTarget.innerHTML = data.data;
      });
  }
}
