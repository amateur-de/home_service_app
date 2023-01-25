# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    if current_admin_user.seller?
      services_path
    elsif current_admin_user.customer?
      available_services_path
    elsif current_admin_user.moderator?
      pending_services_path
    end
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name age role])
  end
end
