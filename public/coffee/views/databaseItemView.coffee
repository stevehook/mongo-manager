class window.DatabaseItemView extends Backbone.View
  tagName: 'li'
  className: 'databaseItem'

  events:
    'click .databaseItem': 'openDatabase'

  initialize: ->
    @template = _.template $('#databaseItemTemplate').html()

  render: ->
    id = @model.get '_id'
    $(@el).html @template({ id: id, name: @model.get('name'), url: "databases/#{id}" })
    this

  openDatabase: (event) =>
    # TODO: Properly handle repeated calls (e.g. toggle visibility of the child collections)
    @collectionsView = new CollectionsView(this, @model)


# TODO: Maybe we need to merge this into the view above but for the time being...
class window.CollectionsView extends Backbone.View
  tagName: 'div'
  className: 'childPanel'

  initialize: (@parentView, @model) ->
    @collections = @model.loadCollections()
    @collections.bind 'add', this.render
    @collections.bind 'reset', this.render
    @collections.fetch()

  render: =>
    console.log 'CollectionsView#render'
    @el = $('.childCollection', @parentView.el)

    # TODO: Render a child panel and then create a CollectionItemView for each collection
    elements = []
    @collections.each (collection) ->
      view = new CollectionItemView({ model: collection })
      elements.push view.render().el
    $(@el).append elements
    this


# TODO: Need to put this into a separate file
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
