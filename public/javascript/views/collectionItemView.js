(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.CollectionItemView = (function() {
    __extends(CollectionItemView, Backbone.View);
    function CollectionItemView() {
      this.gotoCollection = __bind(this.gotoCollection, this);
      CollectionItemView.__super__.constructor.apply(this, arguments);
    }
    CollectionItemView.prototype.tagName = 'li';
    CollectionItemView.prototype.className = 'collectionItem';
    CollectionItemView.prototype.events = {
      'click .collectionItem > span': 'gotoCollection'
    };
    CollectionItemView.prototype.initialize = function(databaseID) {
      this.databaseID = databaseID;
      return this.template = _.template($('#collectionItemTemplate').html());
    };
    CollectionItemView.prototype.render = function() {
      var id;
      id = this.model.get('id');
      $(this.el).html(this.template({
        id: id,
        name: this.model.get('name'),
        url: "databases/" + this.databaseID + "/collections/" + id
      }));
      return this;
    };
    CollectionItemView.prototype.openCollection = function(event) {};
    CollectionItemView.prototype.gotoCollection = function(event) {
      var collectionID;
      collectionID = $(event.target).parent().attr('data-id');
      return window.location.hash = "databases/" + (this.model.get('id')) + "/collections/" + collectionID;
    };
    return CollectionItemView;
  })();
}).call(this);
