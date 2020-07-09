class ApplicationController < ActionController::Base
  # Include Knock within your application.
  #  include Knock::Authenticable
  #protect_from_forgery


  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
     if current_user.supervisor_role?
       activity_logs_path
     else
       root_path
     end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to  root_url , :alert => exception.message
  end

end
