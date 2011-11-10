class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:databaseName/collections/:collectionName/documents": "showDocuments",
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
      console.log databases
      if database
        collection = databases.getCollection databaseName, collectionName
        if collection
          collectionDetailView = new CollectionDetailView({ databaseModel: database, model: collection })
          collectionDetailView.render()

    showDocuments: (databaseName, collectionName) =>
      console.log 'AppRouter#showDocuments'
      # collection = new Documents({ databaseName: databaseName, collectionName: collectionName })
      # documentView = new DocumentView({ collection: collection })
      # documentView.render()

