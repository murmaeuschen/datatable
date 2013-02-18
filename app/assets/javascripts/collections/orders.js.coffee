class Shop.Collections.Orders extends Backbone.Collection

  baseUrl: '/api/orders'
  model: Shop.Models.Order

  parse: (resp) =>
    @setPageInfo(resp)
    resp["models"]


  setPageInfo: (options) =>
    @f_by = ""
    @search = ""
    @page = options['page']
    @pp = options['pp']  
    @num_pages = options['num_pages']
    @total_count = options['total_count']
    @orderBy = "id asc" 

  pageInfo: =>
    info =
      f_by: @f_by
      search: @search
      page: @page
      pp: @pp
      num_pages: @num_pages
      total_count: @total_count
      next: false
      orderBy: @orderBy
      #fields: @fields
      #start_with: @start_with
      #request: @request

  setParams:(orderBy, page, pp) =>
    return unless page > 0
    [oldOrderBy, @orderBy] = [@orderBy, String(orderBy)]
    [oldPage, @page] = [@page, Number(page)]
    [oldPP, @pp] = [@pp, Number(pp)]
    @fetch() unless oldOrderBy == @orderBy && oldPage == @page && oldPP == @pp

  url: ->
    _.locationWithParams(@baseUrl, {orderBy: @orderBy, page: @page, pp: @pp})