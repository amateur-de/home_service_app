# frozen_string_literal: true

class PendingServicesController < ApplicationController
  def index
    @services = Service.pending
  end
end
