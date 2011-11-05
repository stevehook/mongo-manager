(function() {
  describe('DatabaseItemView', function() {
    beforeEach(function() {
      return loadFixtures('_databaseItemTemplate.haml');
    });
    afterEach(function() {});
    return it('should render a database li', function() {
      var database, html, view;
      database = new Database({
        id: 'Test',
        _id: 'Test',
        name: 'Test'
      });
      view = new DatabaseItemView({
        model: database
      });
      view.render();
      html = $(view.el).html();
      return expect(html).toMatch('data-url="databases/Test"');
    });
  });
}).call(this);
