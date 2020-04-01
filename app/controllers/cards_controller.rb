class CardsController < ApplicationController
  require "payjp"

  def new
    cards = Card.where(user_id: current_user.id)
    redirect_to action: "show" if cards.exists?
  end

  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete 
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to root_path
  end

  def show 
    cards = Card.find_by(user_id: current_user.id)
    if cards.blank?
      redirect_to root_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(cards.customer_id)
      @default_card_information = customer.cards.retrieve(cards.card_id)
    end
  end
end

