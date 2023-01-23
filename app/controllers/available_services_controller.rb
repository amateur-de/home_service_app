# frozen_string_literal: true

class AvailableServicesController < ApplicationController
  def index
    @services = Service.approved.available
  end

  def show
    @service = Service.find(params[:id])
  end
end
