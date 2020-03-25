class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit( :name, :text, :category_id, :brand, :status, :fee, :prefecture_id, :shipping, :price, :user_id,images_attributes: [:url])
  end

end
