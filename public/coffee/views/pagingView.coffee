class window.PagingView extends Backbone.View
  className: 'paging'

  initialize: ->
    @template = _.template $('#pagingTemplate').html()

  render: =>
    $(@el).html @template({ count: 'page 1 of 1' })
    this
