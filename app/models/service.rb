# frozen_string_literal: true

class Service < ApplicationRecord
  paginates_per 2
  has_many :seller_services, dependent: :destroy
  has_many :admin_users, through: :seller_services
  has_one :booking, dependent: :destroy
  has_one :review, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :customer, through: :booking, source: :admin_user
  enum status: { pending: 0, approved: 1, rejected: 2 }
  enum availability: { available: 0, ongoing: 1, availed: 2 }
  validates :location, presence: true, length: { maximum: 50 }
  validates :fee, numericality: { greater_than: 0, less_than_or_equal_to: 100_000 }
  validates :time, :start, presence: true
  validate :service_time_validation
end

private

# Custom Validation
def service_time_validation
  errors.add(:start, 'Starting time cannot be in the past') unless start > Time.zone.now
  return if time > start

  errors.add(:time, 'Starting time must be lesser than ending time')
end
