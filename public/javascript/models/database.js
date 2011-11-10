(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.Database = (function() {
    __extends(Database, Backbone.Model);
    function Database() {
      this.getCollection = __bind(this.getCollection, this);
      this.afterLoad = __bind(this.afterLoad, this);
      Database.__super__.constructor.apply(this, arguments);
    }
    Database.prototype.defaults = {
      collectionCount: 0
    };
    Database.prototype.initialize = function() {};
    Database.prototype.afterLoad = function() {
      if (this.attributes.collections && Array.isArray(this.attributes.collections)) {
        this.collections = new Collections(this);
        return this.collections.reset(this.attributes.collections);
      }
    };
    Database.prototype.select = function() {};
    Database.prototype.loadCollections = function(name, callback) {
      if (!this.collections) {
        this.collections = new Collections(this);
        this.collections.fetch();
        if (callback) {
          this.collections.bind('reset', __bind(function() {
            return callback(this.collections.get(name));
          }, this));
        }
      }
      return this.collections;
    };
    Database.prototype.getCollection = function(name, callback) {
      var collection;
      console.log(this.collections);
      if (this.collections) {
        collection = this.collections.get(name);
        if (callback) {
          callback(collection);
        }
        return collection;
      } else {
        this.loadCollections(name, callback);
        return null;
      }
    };
    return Database;
  })();
}).call(this);
