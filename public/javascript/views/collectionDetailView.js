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
      this.viewDocuments = __bind(this.viewDocuments, this);
      this.render = __bind(this.render, this);
      CollectionDetailView.__super__.constructor.apply(this, arguments);
    }
    CollectionDetailView.prototype.el = '#content';
    CollectionDetailView.prototype.events = {
      'click a.viewDocumentLink': 'viewDocuments'
    };
    CollectionDetailView.prototype.initialize = function() {
      return this.template = _.template($('#collectionDetailTemplate').html());
    };
    CollectionDetailView.prototype.render = function() {
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    };
    CollectionDetailView.prototype.viewDocuments = function() {
      var url;
      url = "databases/" + (this.options.databaseModel.get('name')) + "/collections/" + (this.model.get('name')) + "/documents";
      return appRouter.navigate(url, true);
    };
    return CollectionDetailView;
  })();
}).call(this);
