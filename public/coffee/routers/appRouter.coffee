class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:databaseName/collections/:collectionName": "showCollection",
      "databases/:name": "showDatabase"

    clear: =>
      # TODO: Should this be where we create the initial views?
      console.log 'AppRouter#clear'

    showDatabase: (name) =>
      database = databases.getDatabase(databaseName)
      databaseDetailView = new DatabaseDetailView(databaseName)
      databaseDetailView.render()

    showCollection: (databaseName, collectionName) =>
      collection = databases.getCollection(databaseName, collectionName)
      collectionDetailView = new CollectionDetailView(collection)
      collectionDetailView.render()

