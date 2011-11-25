(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  window.PagedCollection = (function() {
    __extends(PagedCollection, Backbone.Collection);
    function PagedCollection() {
      PagedCollection.__super__.constructor.apply(this, arguments);
    }
    PagedCollection.prototype.initialize = function(models, options) {
      return this.pageDetails = _.extend({
        pageSize: 20,
        page: 1
      }, options);
    };
    PagedCollection.prototype.parse = function(response) {
      this.pageDetails.pageSize = response.pageSize;
      this.pageDetails.page = response.page;
      this.pageDetails.count = response.count;
      this.pageDetails.pageCount = Math.ceil(response.count / response.pageSize);
      return response.models;
    };
    PagedCollection.prototype.url = function() {
      var baseUrl;
      baseUrl = _.isFunction(this.baseUrl) ? this.baseUrl() : this.baseUrl;
      return "" + baseUrl + "/" + this.pageDetails.pageSize + "/" + this.pageDetails.page;
    };
    PagedCollection.prototype.fetchNext = function() {
      this.pageDetails.page += 1;
      return this.fetch();
    };
    PagedCollection.prototype.fetchPrevious = function() {
      this.pageDetails.page -= 1;
      return this.fetch();
    };
    return PagedCollection;
  })();
}).call(this);
