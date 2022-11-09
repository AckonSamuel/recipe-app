class ApplicationController < ActionController::Base
  before_action :current_user

  #   protected

  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:Firstname, :Lastname])
  #   end
  def current_user
    User.first
  end
end
