class UserTokenController < Knock::AuthTokenController


  def create
    render json: { message: "here created"}
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
