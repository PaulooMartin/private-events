class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :user_time_zone, if: :current_user

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :timezone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  private

  def user_time_zone(&block)
    Time.use_zone(current_user.timezone, &block)
  end
end
