(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.Collection = (function() {
    __extends(Collection, Backbone.Model);
    function Collection() {
      this.select = __bind(this.select, this);
      Collection.__super__.constructor.apply(this, arguments);
    }
    Collection.prototype.select = function() {};
    return Collection;
  })();
}).call(this);
