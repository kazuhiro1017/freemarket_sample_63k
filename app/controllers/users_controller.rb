class UsersController < ApplicationController

before_action:set_session, only: :create

  def my_selling_items
    user = User.find_by(id: session[:user_id])
    @my_items = user.items.order("created_at DESC")
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def profile
  end

  def signout
  end

  def logging_off
    session[:user_id] = nil
    redirect_to root_path
  end

  def card
  end
  

  def login
    @user = User.new
  end

  def logging_in
    @user = User.find_by(email: user_params[:email])
    if verify_recaptcha(model: @user)
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        flash[:notice] = "ログインしました"
        redirect_to("/items")
      else
        flash[:alert] = "メールアドレスまたはパスワードが間違っています"
        redirect_to("/users/login")
      end
    else
      flash[:alert] = "「私はロボットではありません」にチェックを入れてください"
      redirect_to("/users/login")
    end
  end

  def user_add
    @user = User.new
  end

  def phone_add
    if params[:user]
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:last_name] = user_params[:last_name]
      session[:first_name] = user_params[:first_name]
      session[:last_name_kana] = user_params[:last_name_kana]
      session[:first_name_kana] = user_params[:first_name_kana]
      session[:birthday] = birthday_join
    end
    @user = User.new
    if verify_recaptcha(model: @user) == false && params[:user]
      redirect_to action: "user_add"
      flash[:alert] = "「私はロボットではありません」にチェックを入れてください"
    end
  end

  def address_add
    if params[:user]
      session[:phone_number] = user_params[:phone_number]
    end
    user_is_valid
    @user = User.new
    @user.build_address
  end

  def card_add
    @user = User.new
    card = User.where(user_id: @current_user.id)
  end

  def create
    address_is_valid and return
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
      
    )
    @user.build_address(
      post_number: session[:post_number],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building: session[:building]
    )
    
    if @user.save
      session.clear
      session[:user_id] = @user.id
      redirect_to action: 'card_add'
    else
      session.clear
      flash[:alert] = "入力をもう一度やり直してください"
      redirect_to action: 'user_add'
    end
  end

  def complete
  end

  def identification
    @current_user = User.find_by(id: session[:user_id])
    @user = User.new
    @user.build_address
  end

  
  def birthday_join
    date = params[:birthday]
    
    if date["birthday(1i)"].empty? || date["birthday(2i)"].empty? || date["birthday(3i)"].empty?
      return
    end
    
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end
  
  def card_expiry_join
    date = card_params[:card_attributes]
    
    if date["expiry_date(1i)"].empty? || date["expiry_date(2i)"].empty? || date["expiry_date(3i)"].empty?
      return
    end
    
    Date.new date["expiry_date(1i)"].to_i,date["expiry_date(2i)"].to_i,date["expiry_date(3i)"].to_i
  end
  
  def user_is_valid
    
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    if @user.valid?
    else
      i = 0
      @user.errors.full_messages.each do |message|
        key_st = "alert" + "#{i}"
        key = key_st.to_sym
        flash[key] = message
        i += 1
      end
      redirect_to action: "user_add"
    end
  end
  
  def address_is_valid
    
    @address = Address.new(
      post_number: session[:post_number],
        prefecture: session[:prefecture],
        city: session[:city],
        address: session[:address],
        building: session[:building]
      )
      if @address.valid?
        return false
      else
        i = 0
        @address.errors.full_messages.each do |message|
          key_st = "alert" + "#{i}"
          key = key_st.to_sym
          flash[key] = message
          i += 1
        end
        redirect_to action: 'address_add'
        return true
      end
    end
    
    def set_session
      session[:post_number] = address_params[:address_attributes][:post_number]
      session[:prefecture] = address_params[:address_attributes][:prefecture]
      session[:city] = address_params[:address_attributes][:city]
      session[:address] = address_params[:address_attributes][:address]
      session[:building] = address_params[:address_attributes][:building]
    end
    
    
    def card
      @item = Item.find(params[:id]) 
      card = Creditcard.where(user_id: @current_user.id).first
      if card.blank?
        redirect_to root_path
      else
        Payjp.api_key = "sk_test_5dc292a9b6684847081b4730"
        customer = Payjp::Customer.retrieve(card.customer_id)
        @default_card_information = customer.cards.retrieve(card.card_id)
        redirect_to root_path
      end
    end
    
    
    
  end
  
  private 
    def user_params
      params.require(:user).permit(
        :nickname, :email, :password, :last_name, :first_name,
        :last_name_kana, :first_name_kana, :phone_number)
    end

    def address_params
      params.require(:user).permit(
        address_attributes: [:id, :post_number, :prefecture,
          :city, :address, :building])
    end

    def card_params
      params.require(:user).permit(
        card_attributes: [:id, :card_number, "expiry_date(1i)",
         "expiry_date(2i)", "expiry_date(3i)", :security_code])
    end