var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.CardView = Backbone.View.extend({

  

  template: $('[data-template="card-template"]').text(),

  tagName: 'tr',

  render: function(){
    renderObj = {}

    renderObj.english_phrase = this.model.attributes.english_phrase
    renderObj.explanation = this.model.attributes.explanation
    renderObj.updated_at = moment(this.model.attributes.updated_at).from(moment()) 
    renderObj.id = this.model.attributes.id

    this.$el.html(Mustache.render(this.template, renderObj));
    return this;
  }
})