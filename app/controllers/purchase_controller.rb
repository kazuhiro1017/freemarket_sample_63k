class PurchaseController < ApplicationController
  require 'payjp'



  def pay
    card = Creditcard.where(user_id: @current_user.id).first
    Payjp.api_key = 
    "sk_test_5dc292a9b6684847081b4730"
    Payjp::Charge.create(
    :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to done_purchase_path(@current_user.id)
  end

end