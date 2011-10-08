class window.CollectionItemView extends Backbone.View
  tagName: 'li'
  className: 'collectionItem'

  events:
    'click .collectionItem > span': 'gotoCollection'

  initialize: (options) ->
    @database = options.database
    @template = _.template $('#collectionItemTemplate').html()

  render: ->
    id = @model.get 'id'
    $(@el).html @template({ id: id, name: @model.get('name'), url: "databases/#{@database.id}/collections/#{id}" })
    this

  openCollection: (event) ->
    # TODO: 

  gotoCollection: (event) =>
    @model.select()
    url = $(event.target).parent().attr('data-url')
    window.location.hash = url
