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
      database = databases.getDatabase(name)
      if database
        databaseDetailView = new DatabaseDetailView({ model: database })
        databaseDetailView.render()
      else
        databaseDetailView = new DatabaseDetailView({ id: name })


    showCollection: (databaseName, collectionName) =>
      collection = databases.getCollection(databaseName, collectionName)
      collectionDetailView = new CollectionDetailView({ model: collection })
      collectionDetailView.render()

