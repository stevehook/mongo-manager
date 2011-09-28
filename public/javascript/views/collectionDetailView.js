(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.CollectionDetailView = (function() {
    __extends(CollectionDetailView, Backbone.View);
    function CollectionDetailView() {
      this.render = __bind(this.render, this);
      CollectionDetailView.__super__.constructor.apply(this, arguments);
    }
    CollectionDetailView.prototype.el = '#content';
    CollectionDetailView.prototype.initialize = function() {
      return this.template = _.template($('#collectionDetailTemplate').html());
    };
    CollectionDetailView.prototype.render = function() {
      return $(this.el).html(this.template(this.model.toJSON()));
    };
    return CollectionDetailView;
  })();
}).call(this);
