class window.Database extends Backbone.Model
  defaults:
    collection_count: 0

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
