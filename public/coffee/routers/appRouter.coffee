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
      else
        databaseDetailView = new DatabaseDetailView({ id: name })

    showCollection: (databaseName, collectionName) =>
      database = databases.getDatabase databaseName
      if database
        collection = databases.getCollection databaseName, collectionName
        if collection
          collectionDetailView = new CollectionDetailView({ model: collection })
          collectionDetailView.render()
        else
          # TODO
      else
        databases.bind 'reset', ->
          database = databases.getDatabase databaseName
          database.getCollection collectionName, (collection) ->
            collectionDetailView = new CollectionDetailView({ model: collection })
            collectionDetailView.render()
          

