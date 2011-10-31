(function() {
  describe('Collections', function() {
    beforeEach(function() {
      return this.server = sinon.fakeServer.create();
    });
    afterEach(function() {
      return this.server.restore();
    });
    return it('fetch fills a collection of collections', function() {
      var collections, database;
      this.server.respondWith("GET", "/databases/test/collections", [
        200, {
          "Content-Type": "application/json"
        }, '[{"id": "collection1", "name": "collection1"}, {"id": "collection2", "name": "collection2"}]'
      ]);
      database = new Database({
        id: 'test',
        name: 'test'
      });
      collections = new Collections(database);
      collections.fetch();
      this.server.respond();
      console.log(collections);
      return expect(collections.length).toEqual(2);
    });
  });
}).call(this);
