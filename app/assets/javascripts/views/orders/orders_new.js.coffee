class Shop.Views.OrdersNew extends Backbone.View

  el: '#container'

  template: JST['orders/new']

  events:
    "submit #new_order": "createOrder"

  
  initialize: ->
    @collection.on('add', @render, @)
    @render()
    
  render: ->
    @$el.html(@template())
    @

  createOrder: (event) ->    
    event.preventDefault()    
    attributes = 
      order_number: $(@el).find('#order_number').val()
      #pref_delivery_date: $(@el).find('#pref_delivery_date').val()      
      #role: $(@el).find('#assignee :selected').val()

    @collection.create attributes,
      wait: true
      success: -> 
        $('#new_order')[0].reset()            
      error: @handleError

  handleError: (order, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages