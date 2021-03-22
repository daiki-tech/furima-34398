class ItemsController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :create]
  before_action :set_item,            only: [:show, :edit]
  before_action :sold_out_item,       only: [:index]

  def index
    @items = Item.all.order('created_at DESC')
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

  # def update
  #   @item = Item.find(params[:id])
  #   if item.update(item_params)
  #     redirect_to items_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @item = Item.find(params[:id])
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :shipping_charge_id, :shipping_area_id, :shipping_date_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_out_item
    redirect_to root_path if @item.present?
  end
end
