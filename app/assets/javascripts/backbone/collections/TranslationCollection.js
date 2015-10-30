var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Collections.TranslationCollection = Backbone.Collection.extend({
  url: '/api/users/translations',
  model: Meowth.Models.Card
})