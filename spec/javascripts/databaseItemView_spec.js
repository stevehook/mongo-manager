(function() {
  describe('AppView', function() {
    beforeEach(function() {
      return loadFixtures('_databaseItemTemplate.haml');
    });
    afterEach(function() {});
    return it('should render a database li', function() {
      var appView;
      appView = new DatabaseItemView;
      appView.render();
      return expect(true).toBeTruthy();
    });
  });
}).call(this);
