(function() {
  $(function() {
    console.log('hello from coffee script');
    window.appRouter = new AppRouter();
    return window.appView = new AppView();
  });
}).call(this);
