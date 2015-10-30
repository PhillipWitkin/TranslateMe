var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

Meowth.Views.CardShow = Backbone.View.extend({

  events: {
    'click .close': 'close',
    'click [data-id="add-translation"]': 'addTranslation',
    'click [data-id="add-favorite"]': 'addFavorite'
  },

  initialize: function(){
    var self = this;
    current_user = $('#current_user').attr('data-user')
    console.log(current_user)
    if (current_user){
      $.ajax({
        url: 'api/users/favorites'
      }).done(function(data){
        var favIds = _.pluck(data, 'card_id');
        var card_id = self.model.get('id')
        if (_.contains(favIds, card_id)){
          $('.star').css("color", "papayawhip")
        } else {
          $('.star').css("color", "grey")
        }
      })
    }
    if (this.model.get("english_phrase")) {
      this.render();    
      this.$el.modal('setting', 'closable', false)
      var self = this
      window.setTimeout(function(){
        self.$el.modal("show")
      }, 600)
    } else {
      this.model.fetch();
    }
  },

  className: "ui modal",

  template: $('[data-template="card-show-template"]').text(),

  render: function(){
    this.$el.html(Mustache.render(this.template, this.model.attributes))
    
    var collUrl = '/api/cards/' + this.model.get("id") + '/card_translations'

    trCollection = new Meowth.Collections.CardTranslationsCollection()
    trCollection.url = collUrl
    trCollection.reset()
    var translationCollectionView = new Meowth.Views.TranslationCollectionView({
      collection: trCollection,
      el: $('[data-id="translation-list"]')
    })
    trCollection.fetch();
  },

  addTranslation: function(event) {
    event.preventDefault()

    formDataObject = {}

    formDataObject.language = $('[name="language"]').val()
    formDataObject.translation = $('[name="translation"]').val()
    formDataObject.phonetic = $('[name="phonetic"]').val()
    formDataObject.meaning = $('[name="meaning"]').val()
    formDataObject.card_id = $('[name="card_id"]').val()
    formDataObject.user_id = $('[name="user_id"]').val()

    $('.ui.form')[0].reset();
    trCollection.url = 'api/users/translations'
    trCollection.create(formDataObject)
  },

  addFavorite: function (event) {
    event.preventDefault();
    var self = this;
    $.ajax({
      url: 'api/users/favorites'
    }).done(function(data){
      var favIds = _.pluck(data, 'card_id');
      var card_id = self.model.get('id')
      if (_.contains(favIds, card_id)){

        fave = _.findWhere(data, {card_id : card_id})
        fave_id = fave.id

        $.ajax({
          method: "DELETE",
          url: "api/users/favorites/" + fave_id,
        }).done(function(data){
          $('.star').css("color", "grey")
        })
      } else {
        $.ajax({
          method: "POST",
          url: "api/users/favorites",
          data: {"card_id": card_id}
        }).done(function(data){
          $('.star').css("color", "papayawhip")
        })
      }
    })
  },

  close: function(){
    var self = this;
    window.setTimeout(function(){
      // translationCollectionView.remove()
      self.remove();
      window.history.back();
      // appRouter.navigate("", {trigger: true, replace: true})
    }, 800)

  }
})








