(function() {
  describe('Paged Collections', function() {
    beforeEach(function() {
      return this.server = sinon.fakeServer.create();
    });
    afterEach(function() {
      return this.server.restore();
    });
    it('fetches the first page', function() {
      var collection;
      this.server.respondWith("GET", "/pagedCollection/5/1", [
        200, {
          "Content-Type": "application/json"
        }, '{"count": 37, "page": 1, "pageSize": 5, "models": [{"id": "1", "name": "object1"}, {"id": "2", "name": "object2"}, {"id": "3", "name": "object3"}, {"id": "4", "name": "object4"}, {"id": "5", "name": "object5"}]}'
      ]);
      collection = new PagedCollection({}, {
        pageSize: 5
      });
      collection.baseUrl = '/pagedCollection';
      collection.fetch();
      this.server.respond();
      expect(collection.length).toEqual(5);
      expect(collection.pageDetails.count).toEqual(37);
      expect(collection.pageDetails.pageCount).toEqual(8);
      expect(collection.pageDetails.pageSize).toEqual(5);
      return expect(collection.pageDetails.page).toEqual(1);
    });
    return it('fetches the next page', function() {
      var collection;
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
      collection = new PagedCollection({}, {
        pageSize: 5
      });
      collection.baseUrl = '/pagedCollection';
      collection.fetch();
      this.server.respond();
      collection.fetchNext();
      this.server.respond();
      expect(collection.length).toEqual(5);
      expect(collection.pageDetails.count).toEqual(37);
      expect(collection.pageDetails.pageCount).toEqual(8);
      expect(collection.pageDetails.pageSize).toEqual(5);
      return expect(collection.pageDetails.page).toEqual(2);
    });
  });
}).call(this);
