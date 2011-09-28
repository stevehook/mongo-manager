class window.CollectionDetailView extends Backbone.View
  el: '#content'

  initialize: () ->
    @template = _.template $('#collectionDetailTemplate').html()

  render: =>
    $(@el).html @template(@model.toJSON())
