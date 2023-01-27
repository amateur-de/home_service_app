# frozen_string_literal: true

class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  has_many :seller_services, dependent: :destroy
  has_many :services, through: :seller_services
  has_many :bookings, dependent: :destroy
  has_many :booked_services, through: :bookings, source: :service
  has_one_attached :avatar
  enum role: { seller: 0, customer: 1, moderator: 2 }
end
