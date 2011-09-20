class window.DatabaseItemView extends Backbone.View
  tagName: 'li'
  className: 'databaseItem'
  events: 
    'click': 'open'

  render: ->
    $(this.el).html(this.model.get('name'))
