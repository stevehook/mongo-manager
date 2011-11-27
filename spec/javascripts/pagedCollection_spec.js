(function() {
  describe('Paged Collections', function() {
    var setupCollection, verifyPageDetails;
    beforeEach(function() {
      this.server = sinon.fakeServer.create();
      this.server.respondWith("GET", "/pagedCollection/5/1", [
        200, {
          "Content-Type": "application/json"
        }, '{"count": 37, "page": 1, "pageSize": 5, "models": [{"id": "1", "name": "object1"}, {"id": "2", "name": "object2"}, {"id": "3", "name": "object3"}, {"id": "4", "name": "object4"}, {"id": "5", "name": "object5"}]}'
      ]);
      this.server.respondWith("GET", "/pagedCollection/5/2", [
        200, {
          "Content-Type": "application/json"
        }, '{"count": 37, "page": 2, "pageSize": 5, "models": [{"id": "6", "name": "object6"}, {"id": "7", "name": "object7"}, {"id": "8", "name": "object8"}, {"id": "9", "name": "object9"}, {"id": "10", "name": "object10"}]}'
      ]);
      this.server.respondWith("GET", "/pagedCollection/5/3", [
        200, {
          "Content-Type": "application/json"
        }, '{"count": 37, "page": 3, "pageSize": 5, "models": [{"id": "11", "name": "object11"}, {"id": "12", "name": "object12"}, {"id": "13", "name": "object13"}, {"id": "14", "name": "object14"}, {"id": "15", "name": "object15"}]}'
      ]);
      return this.server.respondWith("GET", "/pagedCollection/5/8", [
        200, {
          "Content-Type": "application/json"
        }, '{"count": 37, "page": 8, "pageSize": 5, "models": [{"id": "36", "name": "object36"}, {"id": "37", "name": "object37"}]}'
      ]);
    });
    afterEach(function() {
      return this.server.restore();
    });
    setupCollection = function(page) {
      var collection;
      collection = new PagedCollection({}, {
        pageSize: 5,
        page: page
      });
      collection.baseUrl = '/pagedCollection';
      collection.fetch();
      return collection;
    };
    verifyPageDetails = function(collection, length, count, pageCount, pageSize, page) {
      expect(collection.length).toEqual(length);
      expect(collection.pageDetails.count).toEqual(count);
      expect(collection.pageDetails.pageCount).toEqual(pageCount);
      expect(collection.pageDetails.pageSize).toEqual(pageSize);
      return expect(collection.pageDetails.page).toEqual(page);
    };
    it('fetches the first page', function() {
      var collection;
      collection = setupCollection(1);
      this.server.respond();
      return verifyPageDetails(collection, 5, 37, 8, 5, 1);
    });
    it('fetches the next page', function() {
      var collection;
      collection = setupCollection(1);
      this.server.respond();
      collection.fetchNext();
      this.server.respond();
      return verifyPageDetails(collection, 5, 37, 8, 5, 2);
    });
    it('fetches the previous page', function() {
      var collection;
      collection = setupCollection(3);
      this.server.respond();
      collection.fetchPrevious();
      this.server.respond();
      return verifyPageDetails(collection, 5, 37, 8, 5, 2);
    });
    it('does not attempt to fetch the previous page when on first page already', function() {
      var collection;
      collection = setupCollection(1);
      this.server.respond();
      collection.fetchPrevious();
      this.server.respond();
      return verifyPageDetails(collection, 5, 37, 8, 5, 1);
    });
    it('does not attempt to fetch the next page when on last page already', function() {
      var collection;
      collection = setupCollection(8);
      this.server.respond();
      collection.fetchNext();
      this.server.respond();
      return verifyPageDetails(collection, 2, 37, 8, 5, 8);
    });
    it('fetches the last page', function() {
      var collection;
      collection = setupCollection(1);
      this.server.respond();
      collection.fetchLast();
      this.server.respond();
      return verifyPageDetails(collection, 2, 37, 8, 5, 8);
    });
    return it('fetches the first page', function() {
      var collection;
      collection = setupCollection(3);
      this.server.respond();
      collection.fetchFirst();
      this.server.respond();
      return verifyPageDetails(collection, 5, 37, 8, 5, 1);
    });
  });
}).call(this);
