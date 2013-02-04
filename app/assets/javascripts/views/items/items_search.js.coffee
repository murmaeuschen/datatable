class Shop.Views.ItemsSearch extends Backbone.View

  template: JST['items/search']

  events:
    'click .item_line': 'selectItem'
  
  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)
    @collection.on('destroy', @render, @)
    @collection.on('change', @render, @)

  render: ->
    $(@el).html(@template(items: @collection))
    @collection.each(@appendItem)
    @
  
  appendItem: (item) =>
    view = new Shop.Views.ItemsItem(model: item)
    @$('tbody').append(view.render().el)  
  
  selectItem: ->
    alert "Selected Item"
  