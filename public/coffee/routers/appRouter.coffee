class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:id/collections/:collectionID": "showCollection",
      "databases/:id": "showDatabase"

    clear: =>
      # TODO: Should this be where we create the initial views?
      console.log 'AppRouter#clear'

    showDatabase: (id) =>
      console.log 'AppRouter#showDatabase'
      # TODO: fetch the database model from the global collection
      databaseDetailView = new DatabaseDetailView(id)
      databaseDetailView.render()

    showCollection: (id, collectionID) =>
      console.log 'AppRouter#showDatabase'
      # TODO: fetch the collection model from the global collection
      collectionDetailView = new CollectionDetailView(id, collectionID)
      collectionDetailView.render()

