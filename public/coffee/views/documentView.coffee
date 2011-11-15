class window.DocumentView extends Backbone.View
  tagName: 'li'
  className: 'documentListItem'

  initialize: ->
    @template = _.template $('#documentTemplate').html()

  render: ->
    $(@el).html @template(@model.toJSON())
