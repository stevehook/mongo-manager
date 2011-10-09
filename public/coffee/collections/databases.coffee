class window.Databases extends Backbone.Collection
  model: Database
  url: '/databases'

  initialize: ->
    @selected = null

  getDatabase: (databaseName) =>
    this.get databaseName

  getCollection: (databaseName, collectionName) =>
    console.log "getCollection #{databaseName} #{collectionName}"
    database = this.getDatabase databaseName
    database.getCollection(collectionName)

window.databases = new Databases
