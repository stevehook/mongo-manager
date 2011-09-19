class window.AppView extends Backbone.View
  el: $('#databaseList')

  initialize: ->
    Databases.fetch()

  # TODO: bind the events
  #

window.App = new AppView
