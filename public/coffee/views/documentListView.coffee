class window.DocumentListView extends Backbone.View
  events:
    'click a.viewCollectionLink': 'viewCollection'

  initialize: ->
    @template = _.template $('#documentListTemplate').html()
    @collection.bind 'reset', @render

  render: =>
    $el = $(@el)
    $el.html @template({ name: @collection.options.collectionName })
    $ul = @$('ul.documentList')
    pagingView = new PagingView({ collection: @collection })
    $el.append pagingView.render().el
    @collection.each (doc) =>
      view = new DocumentView({ model: doc })
      view.render()
      $ul.append view.el
    $('#content').empty().append(@el)

  viewCollection: (e) =>
    url = "databases/#{@collection.options.databaseName}/collections/#{@collection.options.collectionName}"
    appRouter.navigate(url, true)
