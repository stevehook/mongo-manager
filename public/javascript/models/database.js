(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
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
      Database.__super__.constructor.apply(this, arguments);
    }
    Database.prototype.defaults = {
      collection_count: 0
    };
    Database.prototype.loadCollections = function() {
      if (!this.collections) {
        this.collections = new Collections(this);
      }
      return this.collections;
    };
    return Database;
  })();
}).call(this);
