class window.PagedCollection extends Backbone.Collection
  initialize: (models, options) ->
    @options = _.extend({ pageSize: 20, page: 1 }, options)

  parse: (response) ->
    # Override the parse method to process the additional paging properties in the response
    console.log response
    response

  url: ->
    "#{@baseUrl}/#{@options.pageSize}/#{@options.page}"

