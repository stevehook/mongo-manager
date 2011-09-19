class window.DatabaseCollection extends Backbone.Collection
  model: Database
  url: 'databases'

window.Databases = new DatabaseCollection
