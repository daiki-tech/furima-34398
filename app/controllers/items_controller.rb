class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new]


  def new
  end

  def create
  end

  def index
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_charge_id, :shipping_area_id, :shipping_date_id, :selling_price).merge(user_id: current.user.id)
  end
end
