class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:databaseName/collections/:collectionName": "showCollection",
      "databases/:name": "showDatabase"

    clear: =>
      homeView = new HomeView()
      homeView.render()
      console.log 'AppRouter#clear'

    showDatabase: (name) =>
      database = databases.getDatabase(databaseName)
      databaseDetailView = new DatabaseDetailView(databaseName)
      databaseDetailView.render()

    showCollection: (databaseName, collectionName) =>
      collection = databases.getCollection(databaseName, collectionName)
      collectionDetailView = new CollectionDetailView({ model: collection })
      collectionDetailView.render()

