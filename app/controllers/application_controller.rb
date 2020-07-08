class ApplicationController < ActionController::Base
  # Include Knock within your application.
  #  include Knock::Authenticable
  # protect_from_forgery

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    activity_logs_path
  end

  protected

  # Method for checking if current_user is admin or not.
  #def authorize_as_admin
  #  return_unauthorized unless !current_user.nil? && current_user.is_admin?
  # end

end
