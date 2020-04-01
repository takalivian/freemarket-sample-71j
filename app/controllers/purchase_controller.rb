class PurchaseController < ApplicationController
  before_action :buy_product, only: [:show, :update]
  require 'payjp'

  def show
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    @item.update( buyer_id: current_user.id)
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price, 
    :customer => card.customer_id, 
    :currency => 'jpy', 
  )
  redirect_to action: 'done' 
  end

  def update
  end

  private
  def buy_product
    @item = Item.find(params[:item_id])
  end
end
