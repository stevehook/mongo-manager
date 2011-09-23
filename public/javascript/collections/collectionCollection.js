(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.CollectionCollection = (function() {
    __extends(CollectionCollection, Backbone.Collection);
    function CollectionCollection() {
      CollectionCollection.__super__.constructor.apply(this, arguments);
    }
    CollectionCollection.prototype.initialize = function(database) {
      this.database = database;
    };
    return CollectionCollection;
  })();
}).call(this);
