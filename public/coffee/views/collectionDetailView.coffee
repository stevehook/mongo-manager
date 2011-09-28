class window.CollectionDetailView extends Backbone.View
  el: '#content'

  render: =>
    console.log 'CollectionDetailView#render'
    $(@el).text 'Should be rendering the collection detail view here...'
