$ ->
  window.appRouter = new AppRouter()
  window.appView = new AppView()
  Backbone.history.start({ pushState: true })
