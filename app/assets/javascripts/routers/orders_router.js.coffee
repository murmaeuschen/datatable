class Shop.Routers.Orders extends Backbone.Router

  routes:
    "orders(/)"                           : "index"
    "orders/new(/)"                       : "newOrder"
    "orders/:id/edit(/)"                  : "edit"
    "orders/:id/items(/)"                 : "addItem"
    "orders/:id/order_items/:id/items(/)" : "editItem"
    ""                                    : "index"
            
  initialize: ->
    @route /orders\/?\?(.*)/, "index", @index # orders?page=10&source=public
    @collection = new Shop.Collections.Orders($('#container').data('order'))
    @collection.setPageInfo($('#container').data('pagination'))
    @collection.fetch()         

  index: (params) ->
    console.log params
    params = _.strToParams(params)
    console.log params
    @collection.setParams(params["orderBy"], params["page"], params["pp"]) if params["orderBy"]? && params["page"]? && params["pp"]?
    view = new Shop.Views.OrdersIndex(collection: @collection)    
    $('#container').html(view.render().el)
  
  newOrder: ->
    view = new Shop.Views.OrdersNew({collection: @collection})    

  edit: (id) ->    
    order = @collection.get(id)   
    view = new Shop.Views.OrdersEdit(model: order)

  addItem: (order_id) ->
    @collection_of_items = new Shop.Collections.Items()
    @collection_of_items.fetch()
    order = @collection.get(order_id)
    view = new Shop.Views.ItemsSearch(collection: @collection_of_items)
    view.order_id = order_id
    view.order_items_collection = order.order_items()
    $('#container').html(view.render().el)
  
  editItem: (order_id,order_item_id) ->
    @collection_of_items = new Shop.Collections.Items()
    @collection_of_items.fetch()    
    order = @collection.get(order_id)
    view = new Shop.Views.OrderItemEdit(collection: @collection_of_items)
    view.order_id = order_id
    view.order_item_id = order_item_id    
    view.order_items_collection = order.order_items()
    $('#container').html(view.render().el)





