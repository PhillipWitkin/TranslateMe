var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.TranslationCollectionView = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.collection, 'add', this.render)
  },
  render: function(model) {
    var newTranslationView = new Meowth.Views.TranslationView({
      model: model
    })
    newTranslationView.render()
    $('[data-id="translation-list"]').append(newTranslationView.$el)
  }
})