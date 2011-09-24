(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.CollectionsView = (function() {
    __extends(CollectionsView, Backbone.View);
    function CollectionsView() {
      this.render = __bind(this.render, this);
      CollectionsView.__super__.constructor.apply(this, arguments);
    }
    CollectionsView.prototype.initialize = function(parentView, model) {
      this.parentView = parentView;
      this.model = model;
      this.collections = this.model.loadCollections();
      this.collections.bind('add', this.render);
      this.collections.bind('reset', this.render);
      return this.collections.fetch();
    };
    CollectionsView.prototype.render = function() {
      var elements;
      console.log('CollectionsView#render');
      this.el = $('.childCollection', this.parentView.el);
      this.el.empty();
      elements = [];
      this.collections.each(function(collection) {
        var view;
        view = new CollectionItemView({
          model: collection
        });
        return elements.push(view.render().el);
      });
      this.el.append(elements);
      return this;
    };
    return CollectionsView;
  })();
}).call(this);
