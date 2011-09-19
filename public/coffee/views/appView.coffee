class window.AppView extends Backbone.View
  el: $('#databaseList')

  initialize: ->
    DatabaseCollection.fetch()

  # TODO: bind the events
  #

window.App = new AppView
