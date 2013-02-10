class Shop.Models.OrderItem extends Backbone.Model
  url: ->
    if @id?
      "/api/order_items/#{@id}"
    else
      "/api/order_items"