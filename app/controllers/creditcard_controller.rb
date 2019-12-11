class CreditcardController < ApplicationController

  require "payjp"

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Creditcard.new(user_id: @current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_users_path
      else
        redirect_to new_creditcard_path
      end
  end

  def pay_second #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Creditcard.new(user_id: @current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_creditcard_path(@current_user.id)
      else
      end
  end

  def pay3 #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Creditcard.new(user_id: @current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
      end
  end


  def delete #PayjpとCardデータベースを削除します
    card = Creditcard.where(user_id: @current_user.id).first
    if card.blank?
      redirect_to root_path
    else
      Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to card_creditcard_path(@current_user.id)
  end

  def delete2 #PayjpとCardデータベースを削除します
    card = Creditcard.where(user_id: @current_user.id).first
    if card.blank?
      redirect_to root_path
    else
      Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to root_path
  end


  def card
    card = Creditcard.where(user_id: @current_user.id).first
    if card.blank?
    else
      Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
 
end
