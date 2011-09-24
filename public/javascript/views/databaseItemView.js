(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.DatabaseItemView = (function() {
    __extends(DatabaseItemView, Backbone.View);
    function DatabaseItemView() {
      this.openDatabase = __bind(this.openDatabase, this);
      DatabaseItemView.__super__.constructor.apply(this, arguments);
    }
    DatabaseItemView.prototype.tagName = 'li';
    DatabaseItemView.prototype.className = 'databaseItem';
    DatabaseItemView.prototype.events = {
      'click .databaseItem': 'openDatabase'
    };
    DatabaseItemView.prototype.initialize = function() {
      return this.template = _.template($('#databaseItemTemplate').html());
    };
    DatabaseItemView.prototype.render = function() {
      var id;
      id = this.model.get('_id');
      $(this.el).html(this.template({
        id: id,
        name: this.model.get('name'),
        url: "databases/" + id
      }));
      return this;
    };
    DatabaseItemView.prototype.openDatabase = function(event) {
      return this.collectionsView = new CollectionsView(this, this.model);
    };
    return DatabaseItemView;
  })();
  window.CollectionsView = (function() {
    __extends(CollectionsView, Backbone.View);
    function CollectionsView() {
      this.render = __bind(this.render, this);
      CollectionsView.__super__.constructor.apply(this, arguments);
    }
    CollectionsView.prototype.tagName = 'div';
    CollectionsView.prototype.className = 'childPanel';
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
      elements = [];
      this.collections.each(function(collection) {
        var view;
        view = new CollectionItemView({
          model: collection
        });
        return elements.push(view.render().el);
      });
      $(this.el).append(elements);
      return this;
    };
    return CollectionsView;
  })();
  window.CollectionItemView = (function() {
    __extends(CollectionItemView, Backbone.View);
    function CollectionItemView() {
      CollectionItemView.__super__.constructor.apply(this, arguments);
    }
    CollectionItemView.prototype.tagName = 'li';
    CollectionItemView.prototype.className = 'collectionItem';
    CollectionItemView.prototype.events = {
      'click .collectionItem': 'openCollection'
    };
    CollectionItemView.prototype.initialize = function(databaseID) {
      this.databaseID = databaseID;
      return this.template = _.template($('#collectionItemTemplate').html());
    };
    CollectionItemView.prototype.render = function() {
      var id;
      id = this.model.get('_id');
      $(this.el).html(this.template({
        id: id,
        name: this.model.get('name'),
        url: "databases/" + this.databaseID + "/collections/" + id
      }));
      return this;
    };
    CollectionItemView.prototype.openCollection = function(event) {};
    return CollectionItemView;
  })();
}).call(this);
