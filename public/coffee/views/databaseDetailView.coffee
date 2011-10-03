class window.DatabaseDetailView extends Backbone.View
  el: '#content'

  initialize: () ->
    @template = _.template $('#databaseDetailTemplate').html()
    databases.bind 'reset', this.getModelAndRender if !@model

  render: =>
    $(@el).html @template(@model.toJSON())
    this

  getModelAndRender: =>
    @model = databases.get(@id)
    @render()
