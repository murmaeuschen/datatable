class Shop.Views.OrdersEdit extends Backbone.View

  el: '#container'

  template: JST['orders/show'] 

  events:
    'click .backbone'  : 'addItemLink'
    'click #cancel'    : 'returnOnMain' 

  initialize: ->
    @model.on('change', @render, @) 
    @render()
    @fillTable()

  render: ->    
    $(@el).html(@template(order: @model))    
    @

  addItemLink: (event) ->
    #log.console event.target.attributes["href"].value
    Backbone.history.navigate("orders/#{@model.get('id')}/items", true)
    #Backbone.history.navigate(event.target.attributes["href"].value, true) 
    false  

  returnOnMain: ->
    if confirm 'Are you sure you want to cancel operation. All data will be lost?'
      Backbone.history.navigate("/orders", true)
    
  fillTable: ->  
    #@collection_of_orders_items = new Shop.Collections.OrderItems({order_id: @id})
    #@collection_of_orders_items.fetch()
        
    @order_items = new Shop.Collections.OrderItems({order_id: @model.get('id')})
    
    @order_items.fetch
      success: (collection) ->
        console.log "There are now #{collection.length} suggestions in our collection."        
        i = 0
        while i < collection.length
          item = collection.at(i)          
          view = new Shop.Views.OrderItemsItem model: item
          $('#example').append view.render().el          
          i++
      error: (collection, response) ->
        console.log "Sad face! Server says #{response.status}."
      

 