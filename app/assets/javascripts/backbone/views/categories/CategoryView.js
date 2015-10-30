var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.CategoryView = Backbone.View.extend({
  
  template: $('[data-template="category-template"]').text(),
  
  tagName: 'tr',

  render: function(){
    var renderedCategory = Mustache.render(this.template, this.model.attributes)
    this.$el.html(renderedCategory)
    return this
  }
})