(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.Databases = (function() {
    __extends(Databases, Backbone.Collection);
    function Databases() {
      this.afterLoad = __bind(this.afterLoad, this);
      this.getCollection = __bind(this.getCollection, this);
      this.getDatabase = __bind(this.getDatabase, this);
      Databases.__super__.constructor.apply(this, arguments);
    }
    Databases.prototype.model = Database;
    Databases.prototype.url = '/databases';
    Databases.prototype.initialize = function() {
      return this.selected = null;
    };
    Databases.prototype.getDatabase = function(databaseName) {
      return this.get(databaseName);
    };
    Databases.prototype.getCollection = function(databaseName, collectionName) {
      var database;
      database = this.getDatabase(databaseName);
      return database.getCollection(collectionName);
    };
    Databases.prototype.afterLoad = function() {
      return this.each(function(database) {
        return database.afterLoad();
      });
    };
    return Databases;
  })();
  window.databases = new Databases;
}).call(this);
