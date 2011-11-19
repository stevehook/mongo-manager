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
    PagingView.prototype.initialize = function() {
      return this.template = _.template($('#pagingTemplate').html());
    };
    PagingView.prototype.render = function() {
      $(this.el).html(this.template({
        count: 'page 1 of 1'
      }));
      return this;
    };
    return PagingView;
  })();
}).call(this);
