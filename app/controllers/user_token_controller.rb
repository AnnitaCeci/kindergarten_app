class UserTokenController < Knock::AuthTokenController

  def create

  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
