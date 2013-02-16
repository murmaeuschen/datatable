class Shop.Collections.Orders extends Backbone.Collection

  baseUrl: '/api/orders'
  model: Shop.Models.Order
  
  #initialize: (options) =>
    #console.log options
    #@setPageInfo(options)

  parse: (resp) =>
    console.log resp
    @setPageInfo(resp["models"])
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

  howManyPer: (newPerPage) =>
    @page = 1
    @pp = newPerPage
    @fetch()

  sortTableAsc: (ident) =># NEED refactor
    @orderBy = "#{ident} asc"
    @fetch()

  sortTableDesc: (ident) =># NEED refactor
    @orderBy = "#{ident} desc"
    @fetch()

  nextPage: =>
    @page += 1
    return @fetch()
 
  previousPage: =>
    @page -= 1
    return @fetch()

  gotoPage: (page) =>
    @page = page
    return @fetch()

  url: ->
    _.locationWithParams(@baseUrl, {orderBy: @orderBy, page: @page, pp: @pp})