class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_add
    @user = User.new
  end

  def phone_add
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:last_name] = params[:user][:last_name]
    session[:first_name] = params[:user][:first_name]
    session[:last_name_kana] = params[:user][:last_name_kana]
    session[:first_name_kana] = params[:user][:first_name_kana]
    session[:birthday] = birthday_join
    @user = User.new
  end

  def address_add
    session[:phone_number] = params[:user][:phone_number]
    @user = User.new
    @user.address = Address.new
  end

  def card_add
    session[:post_number] = params[:user][:address_attributes][:post_number]
    session[:prefecture_id] = params[:user][:address_attributes][:prefecture_id]
    session[:city] = params[:user][:address_attributes][:city]
    session[:address] = params[:user][:address_attributes][:address]
    session[:building] = params[:user][:address_attributes][:building]
    @user = User.new
    @user.card = Card.new
  end

  def create
    # @user = User.new(
      # nickname: session[:nickname],
      # email: session[:email],
      # password: session[:password],
      # last_name: session[:last_name],
      # first_name: session[:first_name],
      # last_name_kana: session[:last_name_kana],
      # first_name_kana: session[:first_name_kana],
      # birthday: session[:birthday],
      # phone_number: session[:phone_number]
    # )
    @address = Address.new(
      post_number: session[:post_number],
      # prefecture_id: session[:prefecture_id],
      city: session[:city],
      address: session[:address],
      building: session[:building]
    )
    
    @card = Card.new(card_params[:card_attributes])
    @card.save

    if @address.save
      redirect_to action: 'complete'
    else
      redirect_to action: 'user_add'
    end
  end

  def complete
  end

  # この辺のメソッドは、paramsにフォームの情報が入る、postの段階でないと働かない。
  private 
    def address_params
      params.require(:user).permit(
        address_attributes: [:post_number, :prefecture_id,
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

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,
        :email,
        :password,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :birthday,
        :phone_number,
        address_attributes: [:post_number, :prefecture_id,
          :city, :address, :building],
        card_attributes: [:card_number, :expiry_date_month,
          :expiry_date_year, :security_code]
      ])
    end

end
