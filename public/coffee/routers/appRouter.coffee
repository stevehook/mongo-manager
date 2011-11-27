class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:databaseName/collections/:collectionName/documents": "showDocuments",
      "databases/:databaseName/collections/:collectionName/documents/*paging": "showDocuments",
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
          collectionDetailView = new CollectionDetailView({ databaseModel: database, model: collection })
          collectionDetailView.render()

    showDocuments: (databaseName, collectionName, paging) =>
      collection = new Documents({}, { databaseName: databaseName, collectionName: collectionName })
      if paging
        pagingParams = paging.split '/'
        collection.pageDetails.pageSize = pagingParams[0] if pagingParams.length > 0
        collection.pageDetails.page = pagingParams[1] if pagingParams.length > 1
      documentView = new DocumentListView({ collection: collection, databaseName: databaseName, collectionName: collectionName })
      collection.fetch()

