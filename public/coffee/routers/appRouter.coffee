class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:databaseName/collections/:collectionName": "showCollection",
      "databases/:name": "showDatabase"

    clear: =>
      homeView = new HomeView()
      homeView.render()

    showDatabase: (name) =>
      database = databases.getDatabase name
      if database
        databaseDetailView = new DatabaseDetailView({ model: database })
        databaseDetailView.render()

    showCollection: (databaseName, collectionName) =>
      database = databases.getDatabase databaseName
      if database
        collection = databases.getCollection databaseName, collectionName
        if collection
          collectionDetailView = new CollectionDetailView({ model: collection })
          collectionDetailView.render()

