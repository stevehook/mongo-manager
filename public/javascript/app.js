(function() {
  $(function() {
    window.appRouter = new AppRouter();
    window.appView = new AppView();
    return Backbone.history.start({
      pushState: true
    });
  });
}).call(this);
