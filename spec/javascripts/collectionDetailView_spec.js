(function() {
  describe('CollectionDetailView', function() {
    beforeEach(function() {
      return loadFixtures('_collectionDetailTemplate.haml', '../spec/javascripts/fixtures/content.html');
    });
    afterEach(function() {});
    return it('should render a collection model to an HTML table', function() {
      var collection, text, view;
      collection = new Collection({
        id: 'Test',
        _id: 'Test',
        name: 'Test',
        documentCount: 32,
        size: 6000,
        storageSize: 100000,
        indexCount: 3,
        indexSize: 2000
      });
      view = new CollectionDetailView({
        model: collection
      });
      view.render();
      text = $(view.el).text();
      expect(text).toMatch(/Collection:\s*Test/);
      expect(text).toMatch(/Storage Size:\s*100000/);
      expect(text).toMatch(/Index Count:\s*3/);
      expect(text).toMatch(/Index Size:\s*2000/);
      expect(text).toMatch(/Size:\s*6000/);
      return expect(text).toMatch(/Document Count:\s*32/);
    });
  });
}).call(this);
