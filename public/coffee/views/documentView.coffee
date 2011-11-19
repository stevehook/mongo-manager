class window.DocumentView extends Backbone.View
  tagName: 'li'
  className: 'documentListItem'

  events:
    'click a.treeIcon': 'toggleDocument'

  initialize: ->
    @template = _.template $('#documentTemplate').html()

  render: ->
    $(@el).html @template({ model: JSON.stringify(@model, null, 2), title: @model.get('_id').$oid })

  toggleDocument: ->
    $pre = @$('pre.documentDetail')
    $icon = this.$('a.treeIcon')
    if $pre.is(':visible')
      $icon.removeClass 'expanded'
      $pre.hide(200)
    else
      $icon.addClass 'expanded'
      $pre.show(200)
