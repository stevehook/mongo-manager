class window.PagingView extends Backbone.View
  className: 'paging'

  events:
    'click a.next': 'nextPage',
    'click a.previous': 'previousPage',
    'click a.first': 'firstPage',
    'click a.last': 'lastPage'

  initialize: ->
    @template = _.template $('#pagingTemplate').html()

  render: =>
    page = @options.collection.pageDetails.page
    pageCount = @options.collection.pageDetails.pageCount
    $(@el).html @template({ count: "page #{page} of #{pageCount}" })
    this

  nextPage: ->
    console.log 'previousPage'
    @options.collection.fetchNext()
    appRouter.navigate @options.collection.url()

  previousPage: ->
    console.log 'previousPage'
    @options.collection.fetchPrevious()
    appRouter.navigate @options.collection.url()

  firstPage: ->
    console.log 'TODO: first'

  lastPage: ->
    console.log 'TODO: last'

