class window.PagedCollection extends Backbone.Collection
  initialize: (models, options) ->
    @pageDetails = _.extend({ pageSize: 20, page: 1 }, options)

  parse: (response) ->
    # Override the parse method to process the additional paging properties in the response
    @pageDetails.pageSize = response.pageSize
    @pageDetails.page = response.page
    @pageDetails.count = response.count
    @pageDetails.pageCount = Math.ceil(response.count / response.pageSize)
    response.models

  url: ->
    baseUrl = if _.isFunction(@baseUrl) then @baseUrl() else @baseUrl
    "#{baseUrl}/#{@pageDetails.pageSize}/#{@pageDetails.page}"

  fetchNext: ->
    @pageDetails.page += 1
    @fetch()

  fetchPrevious: ->
    @pageDetails.page -= 1
    @fetch()

  fetchFirst: ->
    @pageDetails.page = 1
    @fetch()

  fetchLast: ->
    @pageDetails.page = @pageDetails.pageCount
    @fetch()

