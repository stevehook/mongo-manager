(function() {
  describe('Collections', function() {
    beforeEach(function() {
      return this.server = sinon.fakeServer.create();
    });
    afterEach(function() {
      return this.server.restore();
    });
    return it('fetches the first page', function() {
      var collection;
      this.server.respondWith("GET", "/pagedCollection/5/1", [
        200, {
          "Content-Type": "application/json"
        }, '[{"id": "1", "name": "object1"}, {"id": "2", "name": "object2"}, {"id": "3", "name": "object3"}, {"id": "4", "name": "object4"}, {"id": "5", "name": "object5"}]'
      ]);
      collection = new PagedCollection({}, {
        pageSize: 5
      });
      collection.baseUrl = '/pagedCollection';
      collection.fetch();
      this.server.respond();
      return expect(collection.length).toEqual(5);
    });
  });
}).call(this);
