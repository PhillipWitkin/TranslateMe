var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Collections.RecentCards = Backbone.Collection.extend({
  url: '/api/cards',
  model: Meowth.Models.Card
})