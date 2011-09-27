class window.Database extends Backbone.Model
  defaults:
    collection_count: 0

  loadCollections: ->
    unless @collections
      @collections = new Collections(this)
    @collections
