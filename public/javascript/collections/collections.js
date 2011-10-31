(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.Collections = (function() {
    __extends(Collections, Backbone.Collection);
    function Collections() {
      Collections.__super__.constructor.apply(this, arguments);
    }
    Collections.prototype.initialize = function(database) {
      return this.database = database;
    };
    Collections.prototype.model = Collection;
    Collections.prototype.url = function() {
      return "/databases/" + (this.database.get('id')) + "/collections";
    };
    return Collections;
  })();
}).call(this);
