(function() {
  describe('DatabaseDetailView', function() {
    beforeEach(function() {
      return loadFixtures('_databaseDetailTemplate.haml', '../spec/javascripts/fixtures/content.html');
    });
    afterEach(function() {});
    return it('should render a database model into an HTML table', function() {
      var database, text, view;
      database = new Database({
        id: 'Test',
        _id: 'Test',
        name: 'Test',
        collectionCount: 5,
        documentCount: 43,
        dataSize: 6000,
        storageSize: 1000000,
        fileSize: 200000000,
        numExtents: 16,
        indexCount: 13,
        indexSize: 10000
      });
      view = new DatabaseDetailView({
        model: database
      });
      view.render();
      text = $(view.el).text();
      expect(text).toMatch(/Database:\s*Test/);
      expect(text).toMatch(/Data Size:\s*6000/);
      expect(text).toMatch(/Storage Size:\s*1000000/);
      expect(text).toMatch(/File Size:\s*200000000/);
      expect(text).toMatch(/Extent Count:\s*16/);
      expect(text).toMatch(/Collection Count:\s*5/);
      return expect(text).toMatch(/Document Count:\s*43/);
    });
  });
}).call(this);
