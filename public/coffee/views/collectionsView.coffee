class window.CollectionsView extends Backbone.View
  initialize: (@parentView, @model) ->
    @collections = @model.loadCollections()
    @collections.bind 'add', this.render
    @collections.bind 'reset', this.render
    @collections.fetch()

  render: =>
    console.log 'CollectionsView#render'
    @el = $('.childCollection', @parentView.el)

    @el.empty()
    elements = []
    @collections.each (collection) ->
      view = new CollectionItemView({ model: collection })
      elements.push view.render().el
    @el.append elements
    this

  show: =>
    this.isVisible = true
    $(@el).show()

  hide: =>
    this.isVisible = false
    $(@el).hide()


