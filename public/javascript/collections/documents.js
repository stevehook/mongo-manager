(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.Documents = (function() {
    __extends(Documents, Backbone.Collection);
    function Documents() {
      Documents.__super__.constructor.apply(this, arguments);
    }
    Documents.prototype.model = Document;
    Documents.prototype.initialize = function(documents, options) {
      return this.options = options;
    };
    Documents.prototype.url = function() {
      return "/databases/" + this.options.databaseName + "/collections/" + this.options.collectionName + "/documents";
    };
    return Documents;
  })();
}).call(this);
