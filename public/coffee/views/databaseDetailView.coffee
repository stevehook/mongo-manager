class window.DatabaseDetailView extends Backbone.View
  el: '#content'

  initialize: () ->
    @template = _.template $('#databaseDetailTemplate').html()

  render: =>
    $(@el).html @template(@model.toJSON())
    this

