class window.AppView extends Backbone.View

  initialize: ->
    this.el = $('#databaseList')
    _.extend(databases, Backbone.Events)
    databases.bind 'add', this.render
    databases.bind 'reset', this.render
    databases.fetch()

  # addDatabase: (database) =>
  #   id = database.get('_id')
  #   html = this.databaseTemplate { id: id, name: database.get('name'), url: "databases/#{id}" }
  #   $("#databaseList").append(html)

  # refreshDatabases: =>
  #   console.log 'AppView#refreshDatabases'
  #   databases.each(this.addDatabase)

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
