(function() {
  describe('Databases', function() {
    beforeEach(function() {
      return this.server = sinon.fakeServer.create();
    });
    afterEach(function() {
      return this.server.restore();
    });
    it('fetch fills a collection of databases', function() {
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
    return it('is all lovely', function() {
      return expect(true).toBeTruthy();
    });
  });
}).call(this);
