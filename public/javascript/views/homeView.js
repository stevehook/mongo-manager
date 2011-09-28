(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.HomeView = (function() {
    __extends(HomeView, Backbone.View);
    function HomeView() {
      this.render = __bind(this.render, this);
      HomeView.__super__.constructor.apply(this, arguments);
    }
    HomeView.prototype.el = '#content';
    HomeView.prototype.render = function() {
      $(this.el).html('');
      return this;
    };
    return HomeView;
  })();
}).call(this);
