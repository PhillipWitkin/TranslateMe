var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.NewCard = Backbone.View.extend({

  events : {
    'click .positive.right': 'submitNewCard',
    'click .negative': 'cancel'
  },

  className:"ui modal",

  template: $('[data-template="new-card-form"]').text(),

  render: function(){
    // fetches new card form
    this.$el.empty()
    this.$el.html(this.template)
    // semantic logic to show modal
    this.$el.modal('setting', 'closable', false)
    this.$el.modal('show')
  },

  submitNewCard: function(){
    var englishPhrase = $('[name="english_phrase"]').val()
    var phrases = this.collection.pluck('english_phrase');
    if (phrases.indexOf(englishPhrase) === -1){
      console.log(this.collection)
      this.collection.create({
        english_phrase: $('[name="english_phrase"]').val(),
        explanation: $('[name="explanation"]').val(),
        category_name: $('[name="categories"]').val()      
      }, {wait:true})
      this.$el.remove()
    } else {
      this.$el.remove()
      var newCard = new Meowth.Views.NewCard({collection: this.collection});
      newCard.render();
      newCard.$el.prepend($('[data-template="new-card-error"').text());
    }
  },
  cancel: function () {
    this.$el.remove()
  }

})