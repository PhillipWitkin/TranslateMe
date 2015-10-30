var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.CategoryListView = Backbone.View.extend({
  initialize: function(){ 
    this.listenTo(this.collection, 'add', this.addCategory)

    this.render();
  },

  render: function(){
    var self = this;
    this.collection.each(function(category){ self.addCategory(category) })
  },

  addCategory: function(category){
    var categoryView = new Meowth.Views.CategoryView({model: category});
    categoryView.render()
    this.$el.append(categoryView.$el)
  }
})