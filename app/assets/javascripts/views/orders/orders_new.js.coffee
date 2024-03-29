class Shop.Views.OrdersNew extends Backbone.View

  el: '#container'

  template: JST['orders/new']

  events:
    "submit #new_order": "createOrder"
    'click #addItemLink': 'addItemLink'
    'click #cancel'    : 'returnOnMain'

  
  initialize: ->
    @collection.on('add', @render, @)
    @render()
    
  render: ->
    @$el.html(@template())
    @$('form#new_order').validate
       rules:
         order_number: 
           required: true
           maxlength: 5

       messages:
         order_number: 
           required: "Order number cannot be blank!"
           maxlength: "Order number is too long"
    @

  createOrder: (event) ->    
    event.preventDefault()    
    attributes = 
      order_number:       $(@el).find('#order_number').val()
      status:             $(@el).find('#status').text()      
      total_price:        $(@el).find('#total_price').text()      
      total_num_of_items: $(@el).find('#total_num_of_items').text()
      date_of_ordering:   $(@el).find('#date_of_ordering').text()
    @collection.create attributes,
      wait: true
      success: -> 
        $('#new_order')[0].reset()
        Backbone.history.navigate("/orders", true)            
      error: @handleError

  handleError: (order, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  #addItemLink: (e) ->
    #Backbone.history.navigate("orders/#{@model.get('id')}/items", true)
    #false  

  returnOnMain: ->
    if confirm 'Are you sure you want to cancel operation. All data will be lost?'
      Backbone.history.navigate("/orders", true)