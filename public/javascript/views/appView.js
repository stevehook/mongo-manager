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
      this.refreshDatabases = __bind(this.refreshDatabases, this);
      this.addDatabase = __bind(this.addDatabase, this);
      AppView.__super__.constructor.apply(this, arguments);
    }
    AppView.prototype.el = $('#databaseList');
    AppView.prototype.databaseTemplate = _.template($('#databaseItemTemplate').html());
    AppView.prototype.initialize = function() {
      _.extend(databases, Backbone.Events);
      databases.bind('add', this.render);
      databases.bind('reset', this.render);
      return databases.fetch();
    };
    AppView.prototype.addDatabase = function(database) {
      var html, id;
      id = database.get('_id');
      html = this.databaseTemplate({
        id: id,
        name: database.get('name'),
        url: "databases/" + id
      });
      return $("#databaseList").append(html);
    };
    AppView.prototype.refreshDatabases = function() {
      console.log('AppView#refreshDatabases');
      return databases.each(this.addDatabase);
    };
    AppView.prototype.render = function() {
      var elements;
      console.log('AppView#render');
      $(this.el).empty();
      elements = [];
      databases.each(function(database) {
        var view;
        view = new DatabaseItemView({
          model: database
        });
        return elements.push(view);
      });
      $(this.el).append(elements);
      return this;
    };
    return AppView;
  })();
}).call(this);
