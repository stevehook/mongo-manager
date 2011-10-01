(function() {
  describe('Database', function() {
    beforeEach(function() {
      return this.server = sinon.fakeServer.create();
    });
    afterEach(function() {
      return this.server.restore();
    });
    it('fills a collection of databases', function() {
      var databases;
      this.server.respondWith("GET", "databases", [
        200, {
          "Content-Type": "application/json"
        }, '[{"id": "database1", "name": "database1"}, {"id": "database2", "name": "database2"}]'
      ]);
      databases = new Databases;
      databases.fetch();
      this.server.respond();
      return expect(databases.length).toEqual(2);
    });
    return it('returns a set of collections', function() {
      var database;
      this.server.respondWith("GET", "databases/test/collections", [
        200, {
          "Content-Type": "application/json"
        }, '{"id": "collection1", "name": "collection1"}'
      ]);
      database = new Database({
        id: 'test',
        name: 'test'
      });
      return database.getCollection('collectionName');
    });
  });
}).call(this);
