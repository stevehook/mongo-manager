(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
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
      Databases.__super__.constructor.apply(this, arguments);
    }
    Databases.prototype.model = Database;
    Databases.prototype.url = 'databases';
    Databases.prototype.bind = {
      add: function() {
        return console.log('Something got added to the collection');
      }
    };
    return Databases;
  })();
  window.databases = new Databases;
}).call(this);
