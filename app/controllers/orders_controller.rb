class OrdersController < ApplicationController
  respond_to :html, :json

  def index
  #  @orders = if params[:request]
      #fields = if params[:fields] == "all_columns"
      #  %w(login_name first_name last_name role)
      #else
      #  params[:fields] 
     # end
     # Order.send params[:scope].intern, fields, params[:request]
  #  else
   #   Order.scoped
   # end

    @orders = Order.reorder(params[:orderBy]).page(params[:page]).per(params[:pp])

    @pagination = {
      page:         @orders.current_page,
      num_pages:    @orders.num_pages,
      pp:           @orders.limit_value,
      total_count:  Order.count,
    }
    #@order = current_user.orders.create params[:order] in FUTURE
    
    respond_to do |format|
      format.html
      format.json do
        respond_with({ models: @orders }.merge @pagination)
      end
    end
  end

  def show
    @order = Order.find(params[:id])       
    
    #@all_items = @order.items.select("item_id,item_name,item_description,dimension,price,quantity,price_per_line")
    
    respond_to do |format|
      format.html # show.html.erb      
      format.json { render json: @all_items }
      #format.json { render json: { order: @order, order_items: @all_items.to_json().html_safe } }
    end
  end 
   def create
    @order = Order.create params[:order]
    respond_to do |format|
      format.html { redirect_to user_path(@order) }
      format.json { respond_with @order }
    end
  end
  def update
    @order = Order.find params[:id]
    @order.update_attributes params[:order]
    respond_to do |format|
      format.html
      format.json { respond_with @order }
    end
  end

  def destroy
    respond_with Order.destroy(params[:id])
  end
end