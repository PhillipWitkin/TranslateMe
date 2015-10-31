var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.TranslationView = Backbone.View.extend({
  template: $('[data-template="translation-template"]').text(),

  initialize: function(){
  },
  
  render: function(){
    this.$el.html(Mustache.render(this.template, this.model.attributes))
    return this
  }
})