class Users::RegistrationsController < Devise::RegistrationsController

  def user_add
    @user = User.new
  end

  def phone_add
    @user = User.new
  end

  def address_add
  end

  def card_add
    # params[:user][:birthday] = birthday_join
  end

  def complete
  end

  # この辺のメソッドは、paramsにフォームの情報が入る、postの段階でないと働かない。
  private 
    def user_params
      params.require(:user).permit(:birthday)
    end

    
    def birthday_join
      date = params[:user][:birthday]

      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end

      Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    end

end
