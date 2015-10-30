var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Collections.CardTranslationsCollection = Backbone.Collection.extend({
  model: Meowth.Models.Translation
})