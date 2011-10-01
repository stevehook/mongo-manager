describe 'Database', ->
  beforeEach ->
    @server = sinon.fakeServer.create()
    
  afterEach ->
    @server.restore()

  it 'fills a collection of databases', ->
    @server.respondWith "GET", "databases",
      [200, {"Content-Type": "application/json"}, '[{"id": "database1", "name": "database1"}, {"id": "database2", "name": "database2"}]']
    databases = new Databases
    databases.fetch()
    @server.respond()
    expect(databases.length).toEqual 2

  
  it 'returns a set of collections', ->
    @server.respondWith "GET", "databases/test/collections",
      [200, {"Content-Type": "application/json"}, '{"id": "collection1", "name": "collection1"}']
    database = new Database { id: 'test', name: 'test' }
    database.getCollection 'collectionName'
    # @server.respond()
    # collection = database.getCollection 'collectionName'
    # expect(collection).not.toBeNull()
    # expect(collection.length).toEqual 1

