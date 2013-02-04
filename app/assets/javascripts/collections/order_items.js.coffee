class Shop.Collections.OrderItems extends Backbone.Collection

  model: Shop.Models.OrderItem

  url: '/api/orders'

  initialize: (order_id) ->
    @order_id = order_id
    if order_id?
      @url += '/' + order_id.order_id + '/order_items'

  parse: (resp) =>
    #@init_pagination(resp)
    resp["models"]

 