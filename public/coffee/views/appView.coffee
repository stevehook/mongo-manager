class window.AppView extends Backbone.View
  el: '#navigation'

  events:
    'click .navigationTitle': 'home'

  initialize: ->
    @list = $('#databaseList')
    _.extend(databases, Backbone.Events)
    databases.bind 'add', this.render
    databases.bind 'reset', this.render
    databases.fetch()

  render: =>
    @list.empty()
    elements = []
    databases.each (database) ->
      view = new DatabaseItemView({ model: database })
      elements.push view.render().el
    @list.append elements
    this

  home: =>
    window.location.hash = ''
