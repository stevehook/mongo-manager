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
    pageCount = Math.ceil(@options.collection.pageDetails.count / @options.collection.pageDetails.pageSize)
    $(@el).html @template({ count: "page #{page} of #{pageCount}" })
    this

  nextPage: ->
    console.log 'TODO: next'

  previousPage: ->
    console.log 'TODO: previous'

  firstPage: ->
    console.log 'TODO: first'

  lastPage: ->
    console.log 'TODO: last'

