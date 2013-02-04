class Shop.Routers.Orders extends Backbone.Router

  routes:
    "orders"            : "index"
    "orders/new"        : "newOrder"
    "orders/:id/edit"   : "edit"
    "orders/:id/items"  : "addItem"
        
  initialize: ->
    @collection = new Shop.Collections.Orders($('#container').data('order'))
    @collection.fetch()         

  index: ->
    view = new Shop.Views.OrdersIndex(collection: @collection)    
    $('#container').html(view.render().el)
  
  newOrder: ->
    view = new Shop.Views.OrdersNew({collection: @collection})    

  edit: (id) ->    
    order = @collection.get(id)   
    view = new Shop.Views.OrdersEdit(model: order)

  addItem: ->
    @collection_of_items  = new Shop.Collections.Items()
    @collection_of_items.fetch()    
    view = new Shop.Views.ItemsSearch(collection: @collection_of_items)    
    $('#container').html(view.render().el)
    