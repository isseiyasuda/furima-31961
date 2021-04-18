class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item_id
  before_action :move_to_index
  def index
    
    @order = Order.new
  end

  def create
    
    @order = Order.new(order_params)
    
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                
      )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def find_item_id
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order).permit(:postal_code,:area_id,:municipalities,:street_num,:phone_num,:building).merge(token: params[:token],user_id: current_user.id,item_id: @item.id)
  end

  def move_to_index
    
    if current_user.id == @item.user_id 
    redirect_to root_path 
    end
    redirect_to root_path unless @item.history.blank?
  end
end
