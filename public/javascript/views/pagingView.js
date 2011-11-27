(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.PagingView = (function() {
    __extends(PagingView, Backbone.View);
    function PagingView() {
      this.render = __bind(this.render, this);
      PagingView.__super__.constructor.apply(this, arguments);
    }
    PagingView.prototype.className = 'paging';
    PagingView.prototype.events = {
      'click a.next': 'nextPage',
      'click a.previous': 'previousPage',
      'click a.first': 'firstPage',
      'click a.last': 'lastPage'
    };
    PagingView.prototype.initialize = function() {
      return this.template = _.template($('#pagingTemplate').html());
    };
    PagingView.prototype.render = function() {
      var page, pageCount;
      page = this.options.collection.pageDetails.page;
      pageCount = this.options.collection.pageDetails.pageCount;
      $(this.el).html(this.template({
        count: "page " + page + " of " + pageCount
      }));
      return this;
    };
    PagingView.prototype.nextPage = function() {
      console.log('previousPage');
      this.options.collection.fetchNext();
      return appRouter.navigate(this.options.collection.url());
    };
    PagingView.prototype.previousPage = function() {
      console.log('previousPage');
      this.options.collection.fetchPrevious();
      return appRouter.navigate(this.options.collection.url());
    };
    PagingView.prototype.firstPage = function() {
      return console.log('TODO: first');
    };
    PagingView.prototype.lastPage = function() {
      return console.log('TODO: last');
    };
    return PagingView;
  })();
}).call(this);
