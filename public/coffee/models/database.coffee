class window.Database extends Backbone.Model
  defaults:
    collectionCount: 0

  initialize: ->

  afterLoad: =>
    if (@attributes.collections && Array.isArray(@attributes.collections))
      @collections = new Collections(this)
      @collections.reset @attributes.collections

  select: ->
    # TODO: ...

  loadCollections: (name, callback) ->
    unless @collections
      @collections = new Collections(this)
      @collections.fetch()
      if callback
        @collections.bind 'reset', =>
          callback @collections.get(name)
    @collections

  getCollection: (name, callback) =>
    if @collections
      collection = @collections.get(name)
      callback collection if callback
      collection
    else
      @loadCollections name, callback
      null
