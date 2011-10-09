class window.Collections extends Backbone.Collection
  initialize: (models, options) ->
    @database = options.database
    # TODO: Bind events to a view?

  model: Collection
  url: ->
    "/databases/#{@database.id}/collections"
