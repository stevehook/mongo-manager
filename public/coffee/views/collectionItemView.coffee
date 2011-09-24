class window.CollectionItemView extends Backbone.View
  tagName: 'li'
  className: 'collectionItem'

  events:
    'click .collectionItem': 'openCollection'

  initialize: (@databaseID) ->
    @template = _.template $('#collectionItemTemplate').html()

  render: ->
    id = @model.get '_id'
    $(@el).html @template({ id: id, name: @model.get('name'), url: "databases/#{@databaseID}/collections/#{id}" })
    this

  openCollection: (event) ->
    # TODO: 
