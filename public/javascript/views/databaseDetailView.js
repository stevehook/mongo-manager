(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.DatabaseDetailView = (function() {
    __extends(DatabaseDetailView, Backbone.View);
    function DatabaseDetailView() {
      this.render = __bind(this.render, this);
      DatabaseDetailView.__super__.constructor.apply(this, arguments);
    }
    DatabaseDetailView.prototype.el = '#content';
    DatabaseDetailView.prototype.initialize = function() {
      return this.template = _.template($('#databaseDetailTemplate').html());
    };
    DatabaseDetailView.prototype.render = function() {
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    };
    return DatabaseDetailView;
  })();
}).call(this);
