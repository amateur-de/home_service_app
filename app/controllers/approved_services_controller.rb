# frozen_string_literal: true

class ApprovedServicesController < ApplicationController
  def index
    @services = Service.approved
  end
end
