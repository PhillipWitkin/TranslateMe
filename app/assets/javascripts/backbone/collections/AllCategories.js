var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Collections.AllCategories = Backbone.Collection.extend({
  url: '/api/categories',
  model: Meowth.Models.Category
})