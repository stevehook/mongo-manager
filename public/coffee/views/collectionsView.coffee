class window.CollectionsView extends Backbone.View
  initialize: (@parentView, @model) ->
    @collections = @model.loadCollections()
    @collections.bind 'add', this.render
    @collections.bind 'reset', this.render
    @collections.fetch()

  render: =>
    @el = $('.childCollection', @parentView.el)

    @el.empty()
    elements = []
    @childViews = []
    @collections.each (collection) =>
      view = new CollectionItemView({ model: collection, database: @model })
      elements.push view.render().el
      @childViews.push view
    @el.append elements
    this

  show: =>
    this.isVisible = true
    $(@el).show 200

  hide: =>
    this.isVisible = false
    $(@el).hide 200


