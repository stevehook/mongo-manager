(function() {
  describe('AppView', function() {
    beforeEach(function() {
      return loadFixtures('_databaseItemTemplate.haml');
    });
    afterEach(function() {});
    return it('should render a database li', function() {
      var appView, database;
      database = new Database({
        id: 'Test',
        name: 'Test'
      });
      appView = new DatabaseItemView({
        model: database
      });
      appView.render();
      return expect(true).toBeTruthy();
    });
  });
}).call(this);
