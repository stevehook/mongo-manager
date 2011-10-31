describe 'AppView', ->
  beforeEach ->
    loadFixtures '_databaseItemTemplate.haml'
    
  afterEach ->

  it 'should render a database li', ->
    database = new Database { id: 'Test', name: 'Test' }
    appView = new DatabaseItemView { model: database }
    appView.render()
    expect(true).toBeTruthy()
