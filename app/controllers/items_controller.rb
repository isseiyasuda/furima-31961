class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
  before_action :redirect_root_path, only: [:edit,:update]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
  @item = Item.new
  end 

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path 
    else render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_root_path
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:product_name,:condition_id,:price,:image,:category_id,:condition_id,:charge_id,:area_id,:delivery_id,:description).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_root_path
    redirect_to root_path unless current_user.id == @item.user
  end
 
end
