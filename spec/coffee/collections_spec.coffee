describe 'Collections', ->
  beforeEach ->
    @server = sinon.fakeServer.create()
    
  afterEach ->
    @server.restore()

  it 'fetch fills a collection of collections', ->
    @server.respondWith "GET", "/databases/test/collections",
      [200, {"Content-Type": "application/json"}, '[{"id": "collection1", "name": "collection1"}, {"id": "collection2", "name": "collection2"}]']
    database = new Database { id: 'test', name: 'test' }
    collections = new Collections(database)
    collections.fetch()
    @server.respond()
    console.log collections
    expect(collections.length).toEqual 2

