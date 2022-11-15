class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      # @item = Item.new(item_params)
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_required_id, :price, :user).merge(user_id: current_user.id)
  end
end
