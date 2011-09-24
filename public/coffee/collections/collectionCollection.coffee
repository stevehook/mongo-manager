class window.CollectionCollection extends Backbone.Collection
  initialize: (@database) ->
    # TODO: Bind events to a view?

  model: Collection
  url: ->
    console.log @database
    "databases/#{@database.get('_id')}/collections"
