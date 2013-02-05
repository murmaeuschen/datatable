class Shop.Views.OrdersIndex extends Backbone.View

  template: JST['orders/index']

  render: ->
    $('div').html(@template())
    @
