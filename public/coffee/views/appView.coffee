class window.AppView extends Backbone.View

  initialize: ->
    this.el = $('#databaseList')
    _.extend(databases, Backbone.Events)
    databases.bind 'add', this.render
    databases.bind 'reset', this.render
    databases.fetch()

  render: =>
    console.log 'AppView#render'
    $(this.el).empty()
    elements = []
    databases.each (database) -> 
      view = new DatabaseItemView({ model: database })
      elements.push view.render().el
    console.log elements
    $(this.el).append elements
    console.log $(this.el)
    this
