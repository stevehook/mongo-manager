(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.AppRouter = (function() {
    __extends(AppRouter, Backbone.Router);
    function AppRouter() {
      this.showCollection = __bind(this.showCollection, this);
      this.showDatabase = __bind(this.showDatabase, this);
      this.clear = __bind(this.clear, this);
      AppRouter.__super__.constructor.apply(this, arguments);
    }
    AppRouter.prototype.routes = {
      "": "clear",
      "databases/:databaseName/collections/:collectionName": "showCollection",
      "databases/:name": "showDatabase"
    };
    AppRouter.prototype.clear = function() {
      var homeView;
      homeView = new HomeView();
      homeView.render();
      return console.log('AppRouter#clear');
    };
    AppRouter.prototype.showDatabase = function(name) {
      var database, databaseDetailView;
      database = databases.getDatabase(name);
      if (database) {
        databaseDetailView = new DatabaseDetailView({
          model: database
        });
        return databaseDetailView.render();
      } else {
        return databaseDetailView = new DatabaseDetailView({
          id: name
        });
      }
    };
    AppRouter.prototype.showCollection = function(databaseName, collectionName) {
      var collection, collectionDetailView;
      collection = databases.getCollection(databaseName, collectionName);
      collectionDetailView = new CollectionDetailView({
        model: collection
      });
      return collectionDetailView.render();
    };
    return AppRouter;
  })();
}).call(this);
