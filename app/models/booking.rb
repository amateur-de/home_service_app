# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :admin_user
  belongs_to :service
  validates :address, presence: true, length: { maximum: 100 }
  validates :time, presence: true
  validate :booking_time_validation
  validates :contact, presence: true, format: { with: /\A\d{4}-\d{7}\z/ }
end

private

def booking_time_validation
  return if (time < service.time) && (time > service.start)

  errors.add(:time, 'Booking time must be less than the service time')
end
