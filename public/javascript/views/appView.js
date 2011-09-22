(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.AppView = (function() {
    __extends(AppView, Backbone.View);
    function AppView() {
      this.render = __bind(this.render, this);
      AppView.__super__.constructor.apply(this, arguments);
    }
    AppView.prototype.initialize = function() {
      this.el = $('#databaseList');
      _.extend(databases, Backbone.Events);
      databases.bind('add', this.render);
      databases.bind('reset', this.render);
      return databases.fetch();
    };
    AppView.prototype.render = function() {
      var elements;
      $(this.el).empty();
      elements = [];
      databases.each(function(database) {
        var view;
        view = new DatabaseItemView({
          model: database
        });
        return elements.push(view.render().el);
      });
      $(this.el).append(elements);
      return this;
    };
    return AppView;
  })();
}).call(this);
