var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Models.Category = Backbone.Model.extend({
  urlRoot: '/api/categories'
})