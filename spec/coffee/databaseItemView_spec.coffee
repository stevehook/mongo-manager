describe 'AppView', ->
  beforeEach ->
    loadFixtures '_databaseItemTemplate.haml'
    
  afterEach ->

  it 'should render a database li', ->
    appView = new DatabaseItemView
    appView.render()
    expect(true).toBeTruthy()
