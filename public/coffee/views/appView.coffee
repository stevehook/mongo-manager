class window.AppView extends Backbone.View

  initialize: ->
    this.el = $('#databaseList')
    _.extend(databases, Backbone.Events)
    databases.bind 'add', this.render
    databases.bind 'reset', this.render
    databases.fetch()

  render: =>
    $(this.el).empty()
    elements = []
    databases.each (database) ->
      view = new DatabaseItemView({ model: database })
      elements.push view.render().el
    $(this.el).append elements
    this
