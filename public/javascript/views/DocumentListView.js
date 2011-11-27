(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.DocumentListView = (function() {
    __extends(DocumentListView, Backbone.View);
    function DocumentListView() {
      this.viewCollection = __bind(this.viewCollection, this);
      this.render = __bind(this.render, this);
      DocumentListView.__super__.constructor.apply(this, arguments);
    }
    DocumentListView.prototype.events = {
      'click a.viewCollectionLink': 'viewCollection'
    };
    DocumentListView.prototype.initialize = function() {
      this.template = _.template($('#documentListTemplate').html());
      return this.collection.bind('reset', this.render);
    };
    DocumentListView.prototype.render = function() {
      var $el, $ul, pagingView;
      $el = $(this.el);
      $el.html(this.template({
        name: this.collection.options.collectionName
      }));
      $ul = this.$('ul.documentList');
      pagingView = new PagingView({
        collection: this.collection
      });
      $el.append(pagingView.render().el);
      this.collection.each(__bind(function(doc) {
        var view;
        view = new DocumentView({
          model: doc
        });
        view.render();
        return $ul.append(view.el);
      }, this));
      $('#content').empty().append(this.el);
      this.delegateEvents();
      pagingView.delegateEvents();
      return this;
    };
    DocumentListView.prototype.viewCollection = function(e) {
      var url;
      url = "databases/" + this.collection.options.databaseName + "/collections/" + this.collection.options.collectionName;
      return appRouter.navigate(url, true);
    };
    return DocumentListView;
  })();
}).call(this);
