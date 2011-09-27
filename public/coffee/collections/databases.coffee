class window.Databases extends Backbone.Collection
  model: Database
  url: 'databases'
  bind:
    add: -> console.log('Something got added to the collection')

window.databases = new Databases
