class window.Collections extends Backbone.Collection
  initialize: (database) ->
    @database = database
    # TODO: Bind events to a view?

  model: Collection
  url: ->
    "/databases/#{@database.id}/collections"
