class window.Collections extends Backbone.Collection
  initialize: (database) ->
    @database = database
    # TODO: Bind events to a view?

  model: Collection
  url: ->
    "/databases/#{@database.get('id')}/collections"
