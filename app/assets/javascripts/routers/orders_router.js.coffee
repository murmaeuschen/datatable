class Shop.Routers.Orders extends Backbone.Router

  routes:
    "orders"            : "index"
    "orders/:id"        : "show"
    "orders/new"        : "newOrder"
    "orders/:id/edit"   : "edit"
    "orders/:id/show"   : "show"
   
    
  initialize: ->
    @collection = new Shop.Collections.Orders($('#container').data('orders'))
    @collection.fetch()     

  index: ->
    view = new Shop.Views.OrdersIndex(collection: @collection)    
    $('#container').html(view.render().el)
  
  show: (id) ->
    order = @collection.get(id)    
    view = new Shop.Views.OrdersEdit({model: order, details: "details"})

  newOrder: ->
    view = new Shop.Views.OrdersNew({collection: @collection})

  edit: (id) ->    
    order = @collection.get(id)   
    view = new Shop.Views.OrdersEdit(model: order)