# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :seller_services, dependent: :destroy
  has_many :admin_users, through: :seller_services
  has_one :booking, dependent: :destroy
  has_one :review, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :customer, through: :booking, source: :admin_user
  enum status: { pending: 0, approved: 1, rejected: 2 }
  enum availability: { available: 0, ongoing: 1, availed: 2 }
  validates :location, :time, presence: true
  validates :fee, numericality: { greater_than: 0 }
end
