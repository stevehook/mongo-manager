describe 'DatabaseDetailView', ->
  beforeEach ->
    loadFixtures '_databaseDetailTemplate.haml', '../spec/javascripts/fixtures/content.html'
    
  afterEach ->

  it 'should render a database model into an HTML table', ->
    database = new Database {
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
    }
    view = new DatabaseDetailView { model: database }
    view.render()
    text = $(view.el).text()
    expect(text).toMatch(/Collection Count:5/)
    expect(text).toMatch(/Document Count:43/)
