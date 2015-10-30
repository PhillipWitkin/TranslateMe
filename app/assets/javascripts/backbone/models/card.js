var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Models.Card = Backbone.Model.extend({
  urlRoot: '/api/cards'
})