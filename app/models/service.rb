# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :seller_services, dependent: :destroy
  has_many :admin_users, through: :seller_services
  enum status: { pending: 0, approved: 1, rejected: 2 }
end
