var Meowth = Meowth || { Models: {}, Collections: {}, Views: {}, Routers: {} };

var recentCollection;
var allCategories;
var translationCollection;
var trCollection;
var appRouter;

Meowth.initialize = function(){
    // instantiate new recents collection
  recentCollection = recentCollection || new Meowth.Collections.RecentCards();

  new Meowth.Views.AddCard({collection: recentCollection});


    //instantiate new user translation cards collection
  translationCollection = translationCollection || new Meowth.Collections.TranslationCollection()

    // instantiate new categories collection
  allCategories = allCategories || new Meowth.Collections.AllCategories();

  appRouter = appRouter || new Meowth.Routers.AppRouter();
  Backbone.history.start();
}


var init = (function(){
  Meowth.initialize();
})()