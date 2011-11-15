(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.DocumentView = (function() {
    __extends(DocumentView, Backbone.View);
    function DocumentView() {
      DocumentView.__super__.constructor.apply(this, arguments);
    }
    DocumentView.prototype.tagName = 'li';
    DocumentView.prototype.className = 'documentListItem';
    DocumentView.prototype.initialize = function() {
      return this.template = _.template($('#documentTemplate').html());
    };
    DocumentView.prototype.render = function() {
      return $(this.el).html(this.template(this.model.toJSON()));
    };
    return DocumentView;
  })();
}).call(this);
