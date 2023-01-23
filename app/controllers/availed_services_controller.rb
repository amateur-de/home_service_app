# frozen_string_literal: true

class AvailedServicesController < ApplicationController
  def index
    @services = current_admin_user.booked_services
  end

  def show
    @service = Service.find(params[:id])
  end
end
