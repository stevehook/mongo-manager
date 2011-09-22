class window.AppRouter extends Backbone.Router
    routes:
      "": "clear",
      "databases/:id": "showDatabase"

    clear: =>
      console.log 'AppRouter#clear'

    showDatabase: (id) =>
      console.log 'AppRouter#showDatabase'

