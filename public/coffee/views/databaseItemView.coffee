class window.DatabaseItemView extends Backbone.View
  tagName: 'li'
  className: 'databaseItem'
    
  initialize: ->
    this.template = _.template $('#databaseItemTemplate').html()

  render: ->
    id = this.model.get '_id'
    $(this.el).html this.template({ id: id, name: this.model.get('name'), url: "databases/#{id}" })
    this
