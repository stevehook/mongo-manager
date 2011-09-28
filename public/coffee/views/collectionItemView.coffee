class window.CollectionItemView extends Backbone.View
  tagName: 'li'
  className: 'collectionItem'

  events:
    'click .collectionItem > span': 'gotoCollection'

  initialize: (@databaseID) ->
    @template = _.template $('#collectionItemTemplate').html()

  render: ->
    id = @model.get 'id'
    $(@el).html @template({ id: id, name: @model.get('name'), url: "databases/#{@databaseID}/collections/#{id}" })
    this

  openCollection: (event) ->
    # TODO: 

  gotoCollection: (event) =>
    collectionID = $(event.target).parent().attr('data-id')
    window.location.hash = "databases/#{@model.get('id')}/collections/#{collectionID}"
