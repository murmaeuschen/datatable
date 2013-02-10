class Shop.Views.OrdersItemsIndex extends Backbone.View

  tagName: 'tbody'
  template: JST['orders/items']

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
    $(@el).html(@template(order_items: @collection))  
    @
