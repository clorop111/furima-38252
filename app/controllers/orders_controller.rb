class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_record = OrderRecord.new
  end


  def create
    @order_record = OrderRecord.new(order_params)
    if @order_record.valid?
      @order_record.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_record).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
  end

end
