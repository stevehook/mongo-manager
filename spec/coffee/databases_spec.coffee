describe 'Databases', ->
  beforeEach ->
    @server = sinon.fakeServer.create()
    
  afterEach ->
    @server.restore()

  it 'fetch fills a collection of databases', ->
    @server.respondWith "GET", "databases",
      [200, {"Content-Type": "application/json"}, '[{"id": "database1", "name": "database1"}, {"id": "database2", "name": "database2"}]']
    databases = new Databases
    databases.fetch()
    @server.respond()
    expect(databases.length).toEqual 2

  it 'is all lovely', ->
    expect(true).toBeTruthy()
