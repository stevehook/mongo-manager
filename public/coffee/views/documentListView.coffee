class window.DocumentListView extends Backbone.View
  initialize: ->
    @template = _.template $('#documentListTemplate').html()
    @collection.bind 'reset', @render

  render: =>
    $el = $(@el)
    $el.html @template({ collectionName: @collection.options.collectionName })
    $ul = @$('ul.documentList')
    @collection.each (doc) =>
      view = new DocumentView({ model: doc })
      view.render()
      $ul.append view.el
    $('#content').empty().append(@el)
