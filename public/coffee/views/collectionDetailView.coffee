class window.CollectionDetailView extends Backbone.View
  el: '#content'

  events:
    'click a.viewDocumentLink': 'viewDocuments'

  initialize: () ->
    @template = _.template $('#collectionDetailTemplate').html()

  render: =>
    $(@el).html @template(@model.toJSON())
    this

  viewDocuments: =>
    url = "databases/#{@options.databaseModel.get('name')}/collections/#{@model.get('name')}/documents"
    appRouter.navigate(url, true)
