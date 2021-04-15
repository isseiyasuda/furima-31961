class OrdersController < ApplicationController
  def index

    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      Payjp.api_key = "sk_test_222661acef74342479f80640"  
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

  def order_params
    params.require(:order).permit(:postal_code,:area_id,:municipalities,:street_num,:phone_num,:building).merge(token: params[:token])
  end
end
