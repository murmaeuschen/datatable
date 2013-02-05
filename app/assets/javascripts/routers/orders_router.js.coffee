class Shop.Routers.Orders extends Backbone.Router

  routes:
    ""         : "index"

  #initialize: ->
    #@collection = new Shop.Collections.Orders($('#order').data('orders'))
    #@collection.init_pagination($('#app').data('pagination'))    

  index: ->
    view = new Shop.Views.OrdersIndex()
    $('#order').html(view.render().el)