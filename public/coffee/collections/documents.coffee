class window.Documents extends PagedCollection
  model: Document

  initialize: (documents, options) ->
    @options = options

  url: ->
    "/databases/#{@options.databaseName}/collections/#{@options.collectionName}/documents"

