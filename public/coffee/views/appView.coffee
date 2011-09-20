class window.AppView extends Backbone.View
  el: $('#databaseList')

  databaseTemplate: _.template($('#databaseItemTemplate').html())

  initialize: ->
    _.extend(databases, Backbone.Events)
    databases.bind 'add', this.addDatabase
    databases.bind 'reset', this.refreshDatabases
    databases.fetch()

  addDatabase: (database) =>
    id = database.get('_id')
    html = this.databaseTemplate { id: id, name: database.get('name'), url: "databases/#{id}" }
    $("#databaseList").append(html)

  refreshDatabases: =>
    databases.each(this.addDatabase)
