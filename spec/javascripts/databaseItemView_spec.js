(function() {
  describe('AppView', function() {
    beforeEach(function() {
      return loadFixtures('_databaseItemTemplate.haml');
    });
    afterEach(function() {});
    return it('should render a database li', function() {
      var appView, database, html;
      database = new Database({
        id: 'Test',
        name: 'Test'
      });
      appView = new DatabaseItemView({
        model: database
      });
      appView.render();
      html = $(appView.el).html();
      console.log(html);
      return expect(html).toMatch('data-url="databases/Test"');
    });
  });
}).call(this);
