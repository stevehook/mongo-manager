class window.Databases extends Backbone.Collection
  model: Database
  url: '/databases'

  initialize: ->
    @selected = null

  getDatabase: (databaseName) =>
    this.get databaseName

  getCollection: (databaseName, collectionName) =>
    database = @getDatabase databaseName
    database.getCollection collectionName

  afterLoad: =>
    console.log @models
    this.each (database) ->
      database.afterLoad()

window.databases = new Databases
