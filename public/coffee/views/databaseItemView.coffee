class window.DatabaseItemView extends Backbone.View
  tagName: 'li'
  className: 'databaseItem'

  events:
    'click .databaseItem > span': 'gotoDatabase',
    'click .collectionItem > span': 'gotoCollection',
    'click .databaseItem a': 'toggleCollections'

  initialize: ->
    @template = _.template $('#databaseItemTemplate').html()

  render: ->
    id = @model.get '_id'
    $(@el).html @template({ id: id, name: @model.get('name'), url: "databases/#{id}" })
    this

  toggleCollections: (event) =>
    console.log 'toggleCollections'
    @collectionsView = new CollectionsView(this, @model) unless @collectionsView
    icon = this.$('a.treeIcon')
    if @collectionsView.isVisible
      icon.removeClass 'expanded'
      @collectionsView.hide()
    else
      icon.addClass 'expanded'
      @collectionsView.show()

  gotoDatabase: (event) =>
    window.location.hash = "databases/#{@model.get('id')}"

  gotoCollection: (event) =>
    collectionID = $(event.target).attr('data-id')
    window.location.hash = "databases/#{@model.get('id')}/collections/#{collectionID}"

