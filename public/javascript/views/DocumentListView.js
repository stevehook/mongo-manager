(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.DocumentListView = (function() {
    __extends(DocumentListView, Backbone.View);
    function DocumentListView() {
      DocumentListView.__super__.constructor.apply(this, arguments);
    }
    DocumentListView.prototype.tagName = 'div';
    DocumentListView.prototype.initialize = function() {};
    DocumentListView.prototype.render = function() {};
    return DocumentListView;
  })();
}).call(this);
