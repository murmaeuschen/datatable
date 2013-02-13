class Shop.Collections.Orders extends Backbone.Collection

  model: Shop.Models.Order

  url: '/api/orders'

  parse: (resp) =>
    #@init_pagination(resp)
    resp["models"]

  