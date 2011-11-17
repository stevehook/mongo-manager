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
      console.log 'showCollection', databaseName, collectionName
      database = databases.getDatabase databaseName
      if database
        collection = databases.getCollection databaseName, collectionName
        if collection
          collectionDetailView = new CollectionDetailView({ databaseModel: database, model: collection })
          collectionDetailView.render()

    showDocuments: (databaseName, collectionName) =>
      collection = new Documents({}, { databaseName: databaseName, collectionName: collectionName })
      documentView = new DocumentListView({ collection: collection, databaseName: databaseName, collectionName: collectionName })
      collection.fetch()

