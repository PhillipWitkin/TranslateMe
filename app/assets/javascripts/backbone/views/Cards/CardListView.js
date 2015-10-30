var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.CardListView = Backbone.View.extend({
  initialize: function(){
    // this.collection.fetch()
    this.listenTo(this.collection, 'add', this.addOne);
    this.render();
  },

  render: function(){
    var self = this;
    // this.collection.each(function(card){ self.addOne(card) })
    _.each(this.collection.models, function(model){ self.addOne(model)})
  },
  addOne: function(card){
    var cardView = new Meowth.Views.CardView({model: card});
    cardView.render();
    this.$el.prepend(cardView.$el)
  },
  dispose: function(){
    this.off()
  }
})