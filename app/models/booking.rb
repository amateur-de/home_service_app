# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :admin_user
  belongs_to :service
end
