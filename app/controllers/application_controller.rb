class ApplicationController < ActionController::Base
   before_action :authenticate_with_token
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :bio)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end
  def authenticate_with_token
    return unless params[:apitoken]

    user = User.find_by_api_token(params[:apitoken])
    sign_in(user)
  end
end
