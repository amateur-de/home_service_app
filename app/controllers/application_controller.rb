# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  def pundit_user
    AdminUser.find(current_admin_user.id)
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::NameError, with: :error_occurred

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  def record_not_found(_exception)
    flash[:alert] = 'The Record Does not Found!'
    redirect_back(fallback_location: root_path)
  end

  def error_occurred(_exception)
    flash[:alert] = 'Something went wrong!'
    redirect_back(fallback_location: root_path)
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def set_resource_service
    @service = Service.find(params[:service_id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age role avatar gender])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name age role avatar gender])
  end
end
