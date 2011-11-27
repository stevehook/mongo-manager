describe 'Paged Collections', ->
  beforeEach ->
    @server = sinon.fakeServer.create()
    @server.respondWith "GET", "/pagedCollection/5/1",
      [200, {"Content-Type": "application/json"},
      '{"count": 37, "page": 1, "pageSize": 5, "models": [{"id": "1", "name": "object1"}, {"id": "2", "name": "object2"}, {"id": "3", "name": "object3"}, {"id": "4", "name": "object4"}, {"id": "5", "name": "object5"}]}']
    @server.respondWith "GET", "/pagedCollection/5/2",
      [200, {"Content-Type": "application/json"},
      '{"count": 37, "page": 2, "pageSize": 5, "models": [{"id": "6", "name": "object6"}, {"id": "7", "name": "object7"}, {"id": "8", "name": "object8"}, {"id": "9", "name": "object9"}, {"id": "10", "name": "object10"}]}']
    @server.respondWith "GET", "/pagedCollection/5/3",
      [200, {"Content-Type": "application/json"},
      '{"count": 37, "page": 3, "pageSize": 5, "models": [{"id": "11", "name": "object11"}, {"id": "12", "name": "object12"}, {"id": "13", "name": "object13"}, {"id": "14", "name": "object14"}, {"id": "15", "name": "object15"}]}']
    @server.respondWith "GET", "/pagedCollection/5/8",
      [200, {"Content-Type": "application/json"},
      '{"count": 37, "page": 8, "pageSize": 5, "models": [{"id": "36", "name": "object36"}, {"id": "37", "name": "object37"}]}']
    
  afterEach ->
    @server.restore()

  setupCollection = (page) ->
    collection = new PagedCollection({}, { pageSize: 5, page: page })
    collection.baseUrl = '/pagedCollection'
    collection.fetch()
    collection

  verifyPageDetails = (collection, length, count, pageCount, pageSize, page) ->
    expect(collection.length).toEqual length
    expect(collection.pageDetails.count).toEqual count
    expect(collection.pageDetails.pageCount).toEqual pageCount
    expect(collection.pageDetails.pageSize).toEqual pageSize
    expect(collection.pageDetails.page).toEqual page

  it 'fetches the first page', ->
    collection = setupCollection 1
    @server.respond()
    verifyPageDetails collection, 5, 37, 8, 5, 1

  it 'fetches the next page', ->
    collection = setupCollection 1
    @server.respond()
    collection.fetchNext()
    @server.respond()
    verifyPageDetails collection, 5, 37, 8, 5, 2

  it 'fetches the previous page', ->
    collection = setupCollection 3
    @server.respond()
    collection.fetchPrevious()
    @server.respond()
    verifyPageDetails collection, 5, 37, 8, 5, 2

  it 'does not attempt to fetch the previous page when on first page already', ->
    collection = setupCollection 1
    @server.respond()
    collection.fetchPrevious()
    @server.respond()
    verifyPageDetails collection, 5, 37, 8, 5, 1

  it 'does not attempt to fetch the next page when on last page already', ->
    collection = setupCollection 8
    @server.respond()
    collection.fetchNext()
    @server.respond()
    verifyPageDetails collection, 2, 37, 8, 5, 8

  it 'fetches the last page', ->
    collection = setupCollection 1
    @server.respond()
    collection.fetchLast()
    @server.respond()
    verifyPageDetails collection, 2, 37, 8, 5, 8

  it 'fetches the first page', ->
    collection = setupCollection 3
    @server.respond()
    collection.fetchFirst()
    @server.respond()
    verifyPageDetails collection, 5, 37, 8, 5, 1
    

