class Shop.Views.ItemsItem extends Backbone.View

  template: JST['items/item']
  tagName: 'tr'
  
  render: ->
    $(@el).html(@template(item: @model))
    @

  
