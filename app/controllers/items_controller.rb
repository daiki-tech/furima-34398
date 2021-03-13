class ItemsController < ApplicationController

  def index

  end
  

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      reditrct_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:nickname).merge(user_id: current_user.id)
  end

end
