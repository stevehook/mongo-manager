class window.CollectionCollection extends Backbone.Collection
  initialize: (@database) ->
    # TODO: Specify the URL
    # TODO: Bind to a view?

  url: ->
    console.log @database
    "databases/#{@database.get('id')}/collections"
