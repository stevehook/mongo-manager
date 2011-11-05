describe 'DatabaseItemView', ->
  beforeEach ->
    loadFixtures '_databaseItemTemplate.haml'
    
  afterEach ->

  it 'should render a database li', ->
    database = new Database { id: 'Test', _id: 'Test', name: 'Test' }
    view = new DatabaseItemView { model: database }
    view.render()
    html = $(view.el).html()
    expect(html).toMatch('data-url="databases/Test"')

