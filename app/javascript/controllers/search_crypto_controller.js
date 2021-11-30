import { Controller } from "stimulus"

export default class extends Controller {
    static targets = ['searchInput'];

  connect() {
    console.log("hello", this.searchInputTarget)
    var client = algoliasearch("T2ZX9HO66V", "7119d2f6f1cd95224251ec2e490e824f")
      var index = client.initIndex('growth_zapier_coinmarketcap');
      var myAutocomplete = autocomplete(this.searchInputTarget, {hint: false}, [
        {
          source: autocomplete.sources.hits(index, {hitsPerPage: 5}),
          displayKey: 'name',
          templates: {
            suggestion: function(suggestion) {
              var direction_class = suggestion.change_24h > 0 ? "green" : "red"
              var sugTemplate = "<div class='row'><img src='" +
                  suggestion.icon +"' /><span class='name'>" +
                  suggestion._highlightResult.name.value + "</span><span class='sign'>"+
                  suggestion._highlightResult.sign.value + " </span><span class='price'>$" +
                  suggestion.price.toFixed(4) + "</span><span class='change " + direction_class + "'>" +
                  suggestion.change_24h.toFixed(2) +"%</span></div>"
              return sugTemplate;
            }
          }
        }
      ])
      // .on('autocomplete:selected', (_event, suggestion) => {
      //   console.log(suggestion.name)
      //   console.log(this.searchInputTarget)
      //   console.log(this.searchInputTarget.value)
      //   this.searchInputTarget.value = suggestion.name
      //   console.log(this.searchInputTarget.value)
      // });

    $(".searchbox [type='reset']").on("click", function() {
      $(".aa-input").focus();
      $(this).addClass("hide");
      myAutocomplete.autocomplete.setVal("");
    });

    $(this.searchInputTarget).on("keyup", function() {
      const $searchbox = $(".aa-input");
      const $reset = $(".searchbox [type='reset']");
      $reset.removeClass('hide');
      if ($searchbox.val().length === 0){
        $reset.addClass("hide");
      }
    });
  }
}
