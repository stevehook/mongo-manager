class window.Databases extends Backbone.Collection
  model: Database
  url: 'databases'
  bind:
    add: -> console.log('Something got added to the collection')

  getDatabase: (databaseName) =>
    this.get databaseName

  getCollection: (databaseName, collectionName) =>
    console.log "getCollection #{databaseName} #{collectionName}"
    database = this.getDatabase databaseName
    database.getCollection(collectionName)

window.databases = new Databases
