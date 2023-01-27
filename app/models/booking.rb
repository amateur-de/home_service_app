# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :admin_user
  belongs_to :service
  validates :address, presence: true, length: { maximum: 100 }
  validates :time, presence: true
  validates :contact, presence: true, format: { with: /\A\d{4}-\d{7}\z/ }
end
