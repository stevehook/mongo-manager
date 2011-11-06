class window.DatabaseDetailView extends Backbone.View
  initialize: () ->
    @template = _.template $('#databaseDetailTemplate').html()
    databases.bind 'reset', this.getModelAndRender if !@model

  render: =>
    $(@el).html @template(@model.toJSON())
    $('#content').empty()
    $('#content').append(@el)
    this

  getModelAndRender: =>
    @model = databases.get(@id)
    @render()
