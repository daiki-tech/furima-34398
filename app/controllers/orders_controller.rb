class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_buyer_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_buyer_params
    params.require(:order_buyer).permit(:postal_code, :shipping_area_id, :city, :address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: order_buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.buyer.present?
      redirect_to root_path
    end
  end

end
