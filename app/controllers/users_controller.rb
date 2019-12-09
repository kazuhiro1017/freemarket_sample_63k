class UsersController < ApplicationController

  def show
  end

  def profile
  end

  def signout
  end

  def destroy
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
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/items")
    else
      flash[:alert] = "メールアドレスまたはパスワードが間違っています"
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
    if params[:user]
      session[:post_number] = address_params[:address_attributes][:post_number]
      session[:prefecture] = address_params[:address_attributes][:prefecture]
      session[:city] = address_params[:address_attributes][:city]
      session[:address] = address_params[:address_attributes][:address]
      session[:building] = address_params[:address_attributes][:building]
    end
    address_is_valid
    @user = User.new
    @user.build_card
  end

  def create
    card_is_valid and return
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
    
    @user.build_card(
      card_number: card_params[:card_attributes][:card_number],
      expiry_date: card_expiry_join,
      security_code: card_params[:card_attributes][:security_code]
    )

    if @user.save
      session.clear
      session[:user_id] = @user.id
      redirect_to action: 'complete'
    else
      session.clear
      flash[:alert] = "入力をもう一度やり直してください"
      redirect_to action: 'user_add'
    end
  end

  def complete
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
      else
        i = 0
        @address.errors.full_messages.each do |message|
          key_st = "alert" + "#{i}"
          key = key_st.to_sym
          flash[key] = message
          i += 1
        end
        redirect_to action: 'address_add'
      end
    end

    def card_is_valid
      @card = Card.new(
        card_number: card_params[:card_attributes][:card_number],
        expiry_date: card_expiry_join,
        security_code: card_params[:card_attributes][:security_code]
      )
      if @card.valid?
        return false
      else
        i = 0
        @card.errors.full_messages.each do |message|
          key_st = "alert" + "#{i}"
          key = key_st.to_sym
          flash[key] = message
          i += 1
        end
        redirect_to action: 'card_add'
        return true
      end
    end

end
