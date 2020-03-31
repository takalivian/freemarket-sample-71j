class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def purchase
    @item = Item.find(params[:id])
    @card = Card.where(user_id: current_user.id)
    unless @card.present?
      redirect_to new_card_path, method: :get
    end
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

end
