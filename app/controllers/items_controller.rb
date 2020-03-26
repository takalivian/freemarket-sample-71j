class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def purchase
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    
  end

  private
  def item_params
    # params.require(:item).permit( :name, :text, :category_id, :brand, :status, :fee, :prefecture_id, :shipping, :price, :user_id,images_attributes: [:url])
  end
end
