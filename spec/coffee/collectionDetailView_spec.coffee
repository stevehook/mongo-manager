describe 'CollectionDetailView', ->
  beforeEach ->
    loadFixtures '_collectionDetailTemplate.haml', '../spec/javascripts/fixtures/content.html'
    
  afterEach ->

  it 'should render a collection model to an HTML table', ->
    collection = new Collection {
      id: 'Test',
      _id: 'Test',
      name: 'Test',
      documentCount: 32,
      size: 6000,
      storageSize: 100000,
      indexCount: 3,
      indexSize: 2000
    }
    view = new CollectionDetailView { model: collection }
    view.render()
    text = $(view.el).text()
    expect(text).toMatch(/Storage Size:\s*100000/)
    expect(text).toMatch(/Index Count:\s*3/)
    expect(text).toMatch(/Index Size:\s*2000/)
    expect(text).toMatch(/Size:\s*6000/)
    expect(text).toMatch(/Document Count:\s*32/)

