var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.AddCard = Backbone.View.extend({
  events: {
    'click': 'newCardForm'
  },

  el: $('[data-action="new-card-form"]'),

  newCardForm: function(){
    var newCard = new Meowth.Views.NewCard({collection: this.collection});
    newCard.render()
    this.off()
  }
})