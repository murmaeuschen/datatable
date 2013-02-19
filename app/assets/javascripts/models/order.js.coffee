class Shop.Models.Order extends Backbone.Model
  url: ->
    if @id?
      "/api/orders/#{@id}"
    else
      "/api/orders"

  order_items: ->
    unless @_order_items?    
      @_order_items = new Shop.Collections.OrderItems({order_id: @id})
      @_order_items.fetch
        success: ->
          console.log "Download"           
        error: ->
          new Error(message: "Error loading order_items")
    @_order_items    
     

  items: ->
    unless @_items?
      @_items = new Shop.Collections.Items({order_id: @id})
      @_items.fetch()
    @_items   

  
    
