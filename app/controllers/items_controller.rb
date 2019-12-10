class ItemsController < ApplicationController
  
  require 'payjp'
  before_action :set_item, only: [:show, :purchase, :edit, :update, :destroy]

  def index
    @items = Item.where(category: 1..199).order("created_at DESC").limit(10)
    @vuitton = Item.where(brand: "louis vuitton").order("created_at DESC").limit(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.images.attached?
      @item.save
      redirect_to root_path
    else
      flash.now[:alert] = "[必須]を入力してください。"
      render "new"
    end
  end

  def category_find
    respond_to do |format|
      parent = Category.find(params[:category_id])
      @children = parent.children
      format.json
    end
  end



  def purchase1
    @item = Item.find(params[:id]) 
    card = Creditcard.where(user_id: @current_user.id).first
    if card.blank?
      root_path
    else
      Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end



  def pay
    @item = Item.find(params[:id]) 
    card = Creditcard.where(user_id: @current_user.id).first
    Payjp.api_key = 
    "sk_test_5dc292a9b6684847081b4730"
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to done_purchase_path(@current_user.id)

  def show
    @root = @item.category.root.name
    @parent = @item.category.parent.name
    @children = @item.category.name
    # @price = @item.price.to_s.reverse.gsub( /(\d{3})(?=\d)/, '\1,').reverse （プライスの表示の仕方その２）
  end

  def edit
  end

  def update
    if @item.images.attached?
      @item.update(item_params)
      redirect_to root_path
    else
      flash.now[:alert] = "[必須]を入力してください。"
      render "edit"
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def purchase
  end


 

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :brand, :condition, :postage, :delivery_method, :from_prefecture, :delivery_days, :price, images: []).merge(user_id: session[:user_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
