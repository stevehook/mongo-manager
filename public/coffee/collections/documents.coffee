class window.Documents extends Backbone.Collection
  model: Document

  initialize: (documents, options) ->
    @options = options

  url: ->
    "/databases/#{@options.databaseName}/collections/#{@options.collectionName}/documents"

