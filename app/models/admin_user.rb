# frozen_string_literal: true

class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :confirmable

  has_many :seller_services, dependent: :destroy
  has_many :services, through: :seller_services
  has_many :bookings, dependent: :destroy
  has_many :booked_services, through: :bookings, source: :service
  has_one_attached :avatar
  has_one :experience, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
  validates :age, numericality: { greater_than: 10, less_than_or_equal_to: 60 }
  validate :avatar_type
  enum role: { seller: 0, customer: 1, moderator: 2 }
end

private

def avatar_type
  return unless avatar.attached?
  return if avatar.content_type.in?(%('image/png image/jpeg'))

  errors.add(:avatar, 'should be png or jpeg')
end
