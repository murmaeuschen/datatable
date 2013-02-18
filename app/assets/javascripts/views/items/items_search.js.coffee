class Shop.Views.ItemsSearch extends Backbone.View

  template: JST['items/search']

  events:
    'click #cancel'    : 'returnOnMain'
    'click .item_line' : 'selectItem'
    'click #addItem'   : 'addItem'
  
  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)
    @collection.on('destroy', @render, @)
    @collection.on('change', @render, @)

  render: ->
    $(@el).html(@template(items: @collection))
    @collection.each(@appendItem)
    @
  
  appendItem: (item) =>
    view = new Shop.Views.ItemsItem(model: item, collection: @collection)
    @$('tbody').append(view.render().el)  

  selectItem: ->
    itm = @collection.itemStore
    itmName = itm["item_name"]
    itmPrice = Number(itm["price"])
    $(@el).find('#item_name').text(itmName)
    $(@el).find('#price').text(itmPrice)
    $(@el).find('#quantity').val(1)
                

  addItem: (event) ->
    event.preventDefault()
    itm = @collection.itemStore
    itm["quantity"] = Number($(@el).find('#quantity').val())
    itm["dimension"] = $(@el).find('#dimension :selected').val()
    switch itm["dimension"]
      when "Item"    then itm["price"] = itm["price"]*itm["quantity"]
      when "Box"     then itm["price"] = itm["price"]*itm["quantity"]*5
      when "Package" then itm["price"] = itm["price"]*itm["quantity"]*10
    itmQ =
      order_id: Number(@order_id)
      item_id: itm["id"] 
      quantity: itm["quantity"]
      dimension: itm["dimension"]
      price_per_line: itm["price"] 
    order_item = new Shop.Models.OrderItem(itmQ)
    order_item.save()
    @order_items_collection.add order_item, 
      wait: true
      Backbone.history.navigate("/orders/#{@order_id}/edit", true)               
          
  returnOnMain: ->
    if confirm 'Are you sure you want to cancel operation. All data will be lost?'
      Backbone.history.navigate("/orders", true)
    
  