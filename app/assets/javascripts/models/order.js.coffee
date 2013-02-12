class Shop.Models.Order extends Backbone.Model
  url: ->
    if @id?
      "/api/orders/#{@id}"
    else
      "/api/orders"

  order_items: ->
    unless @_order_items?
      @_order_items = new Shop.Collections.OrderItems({order_id: @id})
      @_order_items.fetch()
    @_order_items 


  items: ->
    alert "call items"
    # unless @_order_items?
    #   @_order_items = new Shop.Collections.OrderItems({order_id: @id})
    #   @_order_items.fetch()
    # @_order_items     