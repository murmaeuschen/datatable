class Shop.Views.ItemsItem extends Backbone.View

  template: JST['items/item']
  tagName: 'tr'
  className: 'item_line'
  
  render: ->
    $(@el).html(@template(item: @model))
    @

  
