class window.Documents extends PagedCollection
  model: Document

  initialize: (documents, options) ->
    @options = options
    PagedCollection.prototype.initialize.call(this, documents, options)

  baseUrl: ->
    "/databases/#{@options.databaseName}/collections/#{@options.collectionName}/documents"

