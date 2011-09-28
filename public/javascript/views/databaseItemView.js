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
      this.gotoCollection = __bind(this.gotoCollection, this);
      this.gotoDatabase = __bind(this.gotoDatabase, this);
      this.toggleCollections = __bind(this.toggleCollections, this);
      DatabaseItemView.__super__.constructor.apply(this, arguments);
    }
    DatabaseItemView.prototype.tagName = 'li';
    DatabaseItemView.prototype.className = 'databaseItem';
    DatabaseItemView.prototype.events = {
      'click .databaseItem > span': 'gotoDatabase',
      'click .collectionItem > span': 'gotoCollection',
      'click .databaseItem a': 'toggleCollections'
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
    DatabaseItemView.prototype.toggleCollections = function(event) {
      var icon;
      console.log('toggleCollections');
      if (!this.collectionsView) {
        this.collectionsView = new CollectionsView(this, this.model);
      }
      icon = this.$('a.treeIcon');
      if (this.collectionsView.isVisible) {
        icon.removeClass('expanded');
        return this.collectionsView.hide();
      } else {
        icon.addClass('expanded');
        return this.collectionsView.show();
      }
    };
    DatabaseItemView.prototype.gotoDatabase = function(event) {
      return window.location.hash = "databases/" + (this.model.get('id'));
    };
    DatabaseItemView.prototype.gotoCollection = function(event) {
      var collectionID;
      collectionID = $(event.target).attr('data-id');
      return window.location.hash = "databases/" + (this.model.get('id')) + "/collections/" + collectionID;
    };
    return DatabaseItemView;
  })();
}).call(this);
