# frozen_string_literal: true

class RejectedServicesController < ApplicationController
  def index
    @services = Service.rejected
  end
end
