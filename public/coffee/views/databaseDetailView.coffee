class window.DatabaseDetailView extends Backbone.View
  el: '#content'

  render: =>
    console.log 'DatabaseDetailView#render'
    $(@el).text 'Should be rendering the database detail view here...'

