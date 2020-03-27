class ItemsController < ApplicationController

  def index
  end

  def show
    set_item
  end

  def purchase
  end

  def new
  end

  def create
  end

  def destroy
    set_item
    if @item.destroy
      render :destroy
    else
      flash.now[:alert] = '商品出品取り消しに失敗しました。'
      render :show
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
