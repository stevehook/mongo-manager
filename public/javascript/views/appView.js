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
      this.refreshDatabases = __bind(this.refreshDatabases, this);
      this.addDatabase = __bind(this.addDatabase, this);
      AppView.__super__.constructor.apply(this, arguments);
    }
    AppView.prototype.el = $('#databaseList');
    AppView.prototype.databaseTemplate = _.template($('#databaseItemTemplate').html());
    AppView.prototype.initialize = function() {
      _.extend(databases, Backbone.Events);
      databases.bind('add', this.addDatabase);
      databases.bind('reset', this.refreshDatabases);
      return databases.fetch();
    };
    AppView.prototype.addDatabase = function(database) {
      var html, id;
      id = database.elementID();
      html = this.databaseTemplate({
        id: id,
        name: database.get('name'),
        url: "databases/" + id
      });
      return $("#databaseList").append(html);
    };
    AppView.prototype.refreshDatabases = function() {
      return databases.each(this.addDatabase);
    };
    return AppView;
  })();
  window.App = new AppView;
}).call(this);
