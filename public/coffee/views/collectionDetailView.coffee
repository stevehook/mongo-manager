class window.CollectionDetailView extends Backbone.View
  events:
    'click a.viewDocumentLink': 'viewDocuments'

  initialize: () ->
    @template = _.template $('#collectionDetailTemplate').html()

  render: =>
    console.log 'CollectionDetailView#render'
    console.log @model
    $(@el).html @template(@model.toJSON())
    $('#content').empty()
    $('#content').append(@el)
    this

  viewDocuments: (e) =>
    url = "databases/#{@options.databaseModel.get('name')}/collections/#{@model.get('name')}/documents"
    appRouter.navigate(url, true)
