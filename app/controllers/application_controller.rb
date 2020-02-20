class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_photo])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_photo,:sports_event, :sports_stage, :sports_level, :self_introduction, :gender])
    end
end
