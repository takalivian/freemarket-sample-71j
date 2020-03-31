class PurchaseController < ApplicationController
  before_action :buy_product, only: [:show]
  require 'payjp'

  def show
    card = Card.where(user_id: current_user.id === buyer_id).first
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
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price, 
    :customer => card.customer_id, 
    :currency => 'jpy', 
  )
  redirect_to action: 'done' 
  end

  private
  def buy_product
    @item = Item.find(params[:item_id])
  end
end
