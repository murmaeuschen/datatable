class Shop.Views.OrdersEdit extends Backbone.View

  el: '#container'

  template: JST['orders/show'] 

  initialize: ->
    @model.on('change', @render, @)        
    @render()
    @fillTable()

  render: ->    
    $(@el).html(@template(order: @model))    
    @
    
  fillTable: ->          
    @collection_of_orders_items = @model.order_items()
    view = new Shop.Views.OrdersItemsIndex(collection: @collection_of_orders_items)    
    $('#table_order_items').html(view.render().el) 