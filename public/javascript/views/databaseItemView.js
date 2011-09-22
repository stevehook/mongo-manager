(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
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
      DatabaseItemView.__super__.constructor.apply(this, arguments);
    }
    DatabaseItemView.prototype.tagName = 'li';
    DatabaseItemView.prototype.className = 'databaseItem';
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
    return DatabaseItemView;
  })();
}).call(this);
