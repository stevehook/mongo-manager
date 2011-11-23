describe 'Collections', ->
  beforeEach ->
    @server = sinon.fakeServer.create()
    
  afterEach ->
    @server.restore()

  it 'fetches the first page', ->
    @server.respondWith "GET", "/pagedCollection/5/1",
      [200, {"Content-Type": "application/json"},
      '[{"id": "1", "name": "object1"}, {"id": "2", "name": "object2"}, {"id": "3", "name": "object3"}, {"id": "4", "name": "object4"}, {"id": "5", "name": "object5"}]']
      #'{count: 37, page: 1, pageSize: 5, models: [{"id": "1", "name": "object1"}, {"id": "2", "name": "object2"}, {"id": "3", "name": "object3"}, {"id": "4", "name": "object4"}, {"id": "5", "name": "object5"}]}']
    collection = new PagedCollection({}, { pageSize: 5 })
    collection.baseUrl = '/pagedCollection'
    collection.fetch()
    @server.respond()
    expect(collection.length).toEqual 5

