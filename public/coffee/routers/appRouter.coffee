class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:id": "showDatabase"

    clear: =>
      # TODO: Should this be where we create the initial views?
      console.log 'AppRouter#clear'

    showDatabase: (id) =>
      console.log 'AppRouter#showDatabase'
      databaseDetailView = new DatabaseDetailView(id)
      databaseDetailView.render()

