class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # redirect to profile page upon sign in if empty
  def after_sign_in_path_for(resource)
    if @user.present? && @profile.nil? && @user.admin?
      new_profile_path
    elsif @user.present? && @profile.nil? && @user.user?
      new_profile_path
    else @user.present? && @profile.nil? && @user.publisher?
      new_publisher_path
    end
  end

  private
  
    # rescue method for pundit 
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end


    # whitelist devise
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

end
