class UsersController < ApplicationController
before_action :save_to_session, only: :card_add

  def login
  end

  def user_add
    @user = User.new
  end

  def phone_add
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday] = birthday_join
    @user = User.new
  end

  def address_add
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
  end

  def card_add
    session[:post_number] = params[:user][:address_attributes][:post_number]
    session[:prefecture] = params[:user][:address_attributes][:prefecture]
    session[:city] = params[:user][:address_attributes][:city]
    session[:address] = params[:user][:address_attributes][:address]
    session[:building] = params[:user][:address_attributes][:building]
    @user = User.new
    @user.build_card
  end

  def create
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
      # prefecture: session[:prefecture],
      prefecture: 3,
      city: session[:city],
      address: session[:address],
      building: session[:building]
    )
    
    @user.build_card(card_params[:card_attributes])
    # @user.card.save
    # @user.address.save

    if @user.save
      session[:user_id] = @user.id
      redirect_to action: 'complete'
    else
      redirect_to action: 'user_add'
    end
  end

  def complete
  end

  # この辺のメソッドは、paramsにフォームの情報が入る、postの段階でないと働かない。
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
        card_attributes: [:id, :card_number, :expiry_date_month,
          :expiry_date_year, :security_code])
    end

    
    def birthday_join
      date = params[:birthday]

      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end

      Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    end

    def save_to_session
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

      redirect_to action: 'user_add' unless @user.valid?
    end
end
