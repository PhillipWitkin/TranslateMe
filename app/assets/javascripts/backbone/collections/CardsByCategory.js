var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Collections.CardsByCategory = Backbone.Collection.extend({
  url: '/api/categories',
  model: Meowth.Models.Card
})