class Shop.Views.OrdersEdit extends Backbone.View

  el: '#container'

  template: JST['orders/show'] 

  events:
    'click .backbone': 'navigateLink' 

  initialize: ->
    @model.on('change', @render, @)        
    @render()
    @fillTable()

  render: ->    
    $(@el).html(@template(order: @model))    
    @

  navigateLink: (event) ->
    #log.console event.target.attributes["href"].value
    Backbone.history.navigate("orders/#{@model.get('id')}/items", true)
    #Backbone.history.navigate(event.target.attributes["href"].value, true) 
    false  
    
  fillTable: ->          
    @collection_of_orders_items = @model.order_items()
    view = new Shop.Views.OrdersItemsIndex(collection: @collection_of_orders_items)    
    $('#table_order_items').html(view.render().el) 