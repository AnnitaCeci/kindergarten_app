class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]

  #before_action :authenticate_user,  only: [:auth]


  def index

  end

  # Authorized only method
  #def auth
  #  render json: { status: 200, msg: "You are currently Logged-in as #{current_user.username}" }
  #end
end
