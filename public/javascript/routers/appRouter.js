(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.AppRouter = (function() {
    __extends(AppRouter, Backbone.Router);
    function AppRouter() {
      this.showDatabase = __bind(this.showDatabase, this);
      this.clear = __bind(this.clear, this);
      AppRouter.__super__.constructor.apply(this, arguments);
    }
    AppRouter.prototype.routes = {
      "": "clear",
      "databases/:id": "showDatabase"
    };
    AppRouter.prototype.clear = function() {
      return console.log('AppRouter#clear');
    };
    AppRouter.prototype.showDatabase = function(id) {
      return console.log('AppRouter#showDatabase');
    };
    return AppRouter;
  })();
}).call(this);
