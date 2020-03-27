class ItemsController < ApplicationController

  def index
    # @items = Item.order(created_at: :asc)
    
    @items = Item.includes(:user).order("created_at desc").limit(6)
  end

  def show
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
