(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.DatabaseCollection = (function() {
    __extends(DatabaseCollection, Backbone.Collection);
    function DatabaseCollection() {
      DatabaseCollection.__super__.constructor.apply(this, arguments);
    }
    DatabaseCollection.prototype.model = Database;
    DatabaseCollection.prototype.url = 'databases';
    DatabaseCollection.prototype.bind = {
      add: function() {
        return console.log('Something got added to the collection');
      }
    };
    return DatabaseCollection;
  })();
  window.databases = new DatabaseCollection;
}).call(this);
