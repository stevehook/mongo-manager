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
      this.getModelAndRender = __bind(this.getModelAndRender, this);
      this.render = __bind(this.render, this);
      DatabaseDetailView.__super__.constructor.apply(this, arguments);
    }
    DatabaseDetailView.prototype.initialize = function() {
      this.template = _.template($('#databaseDetailTemplate').html());
      if (!this.model) {
        return databases.bind('reset', this.getModelAndRender);
      }
    };
    DatabaseDetailView.prototype.render = function() {
      $(this.el).html(this.template(this.model.toJSON()));
      $('#content').empty();
      $('#content').append(this.el);
      return this;
    };
    DatabaseDetailView.prototype.getModelAndRender = function() {
      this.model = databases.get(this.id);
      return this.render();
    };
    return DatabaseDetailView;
  })();
}).call(this);
