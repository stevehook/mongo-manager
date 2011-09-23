class window.Database extends Backbone.Model
  defaults:
    collection_count: 0

  loadCollections: ->
    console.log 'Database#loadCollections'
