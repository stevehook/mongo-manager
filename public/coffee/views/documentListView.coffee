class window.DocumentListView extends Backbone.View
  tagName: 'ul'
  className: 'documentList'

  initialize: ->
    @collection.bind 'reset', @render

  render: =>
    @collection.each (doc) =>
      view = new DocumentView({ model: doc })
      view.render()
      $(@el).append view.el
    $('#content').empty()
    $('#content').append(@el)
