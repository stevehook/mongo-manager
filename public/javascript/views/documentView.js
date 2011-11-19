(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.DocumentView = (function() {
    __extends(DocumentView, Backbone.View);
    function DocumentView() {
      DocumentView.__super__.constructor.apply(this, arguments);
    }
    DocumentView.prototype.tagName = 'li';
    DocumentView.prototype.className = 'documentListItem';
    DocumentView.prototype.events = {
      'click a.treeIcon': 'toggleDocument'
    };
    DocumentView.prototype.initialize = function() {
      return this.template = _.template($('#documentTemplate').html());
    };
    DocumentView.prototype.render = function() {
      $(this.el).html(this.template({
        model: JSON.stringify(this.model, null, 2),
        title: this.model.get('_id').$oid
      }));
      return this;
    };
    DocumentView.prototype.toggleDocument = function() {
      var $icon, $pre;
      $pre = this.$('pre.documentDetail');
      $icon = this.$('a.treeIcon');
      if ($pre.is(':visible')) {
        $icon.removeClass('expanded');
        return $pre.hide(200);
      } else {
        $icon.addClass('expanded');
        return $pre.show(200);
      }
    };
    return DocumentView;
  })();
}).call(this);
